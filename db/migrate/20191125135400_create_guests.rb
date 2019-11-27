class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.references :charity, foreign_key: true
      t.string :first_name
      t.date :date_of_birth
      t.string :permanent_address

      t.timestamps
    end
  end
end
