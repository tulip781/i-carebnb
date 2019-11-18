class AddCategoryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
  end
end
# check whether need to add attributes to the models...
