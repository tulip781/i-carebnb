class ChangeAvailabilityToRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :availability
  end
end
