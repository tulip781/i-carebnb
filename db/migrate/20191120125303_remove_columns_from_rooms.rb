class RemoveColumnsFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :availability
    add_column :rooms, :description, :text
    add_column :rooms, :postcode, :string
    add_column :rooms, :facilities, :string
  end
end
