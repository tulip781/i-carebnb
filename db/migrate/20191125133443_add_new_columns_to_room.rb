class AddNewColumnsToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :unavailability, :date
    add_column :rooms, :public_visible, :boolean, default: false
    add_column :rooms, :pets, :text
  end
end
