class CreateCharities < ActiveRecord::Migration[5.2]
  def change
    create_table :charities do |t|
      t.string :name
      t.string :charity_number
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :main_contact
      t.timestamps
    end
  end
end
