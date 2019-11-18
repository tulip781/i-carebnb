class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :address
      t.integer :adult_space
      t.integer :child_space
      t.integer :infant_space
      t.integer :beds
      t.integer :max_stay_length
      t.string :availability

      t.timestamps
    end
  end
end
