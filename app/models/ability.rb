class Ability
  include CanCan::Ability

  def initialize(user)
    @user ||= user
    if @user.present?
      signed_in_user
    else
      guest_user
    end
  end

  def default_user
    can :journal_status, Journal
  end

  def guest_user
    default_user
  end

  def signed_in_user
    methods = @user.role.downcase
    send(methods)
  end

  def user
    default_user
  end

  def admin
    default_user
    can :manage, Account
    can :manage, Post
  end

  def superadmin
    can :manage, :all
  end
end
