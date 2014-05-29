class AddUrlToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :url, :string, null: false, default: ""
  end
end
