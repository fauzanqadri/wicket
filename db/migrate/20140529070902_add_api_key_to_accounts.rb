class AddApiKeyToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :api_key, :string, null: false, default: 0
  end
end
