class CreateResidents < ActiveRecord::Migration[5.2]
  def change
    create_table :residents do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.date :date_of_birth
      t.boolean :safeguarding_check?
      t.references :room, foreign_key: true
      t.string :gender
      t.string :title

      t.timestamps
    end
  end
end
