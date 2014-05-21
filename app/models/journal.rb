class Journal < ActiveRecord::Base
  include Journalist::JournalModel
  #has_many :journal_accounts, dependent: :destroy
end
