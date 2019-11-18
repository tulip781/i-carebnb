class AddCategoryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :title, :string
    add_column :users, :first_name, :string
    add_column :users, :surname, :string
    add_column :users, :address, :text
    add_column :users, :phone_number, :text
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :text
    add_column :users, :host, :boolean

  end
end
# check whether need to add attributes to the models...
