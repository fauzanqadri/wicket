class Account < ActiveRecord::Base
  ROLE = %w{USER ADMIN SUPERADMIN}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  validates_presence_of :role, :username
  validates_inclusion_of :role, in: ROLE
  validates_uniqueness_of :username, case_sensitive: false
  before_validation :fill_api_key

  def avatar
    md5 = Digest::MD5.new
    md5.update(self.email)
    "http://www.gravatar.com/avatar/#{md5.hexdigest}"
  end



  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  private
  def create_authorization
    authorization = Authorization.new(account_id: self.id)
    authorization.save
  end

  def fill_api_key
    key = generate_api_key SecureRandom.hex(20)
    self.api_key = key
  end

  def generate_api_key key
    matched_key = Account.find_by_api_key(key)
    return key unless matched_key.present?
    generate_api_key SecureRandom.hex(20)
  end
end
