class AddFullNameToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :full_name, :string, null: false, default: ""
  end
end
