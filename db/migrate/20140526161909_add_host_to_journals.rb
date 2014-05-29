class AddHostToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :host, :string, null: false, default: ""
  end
end
