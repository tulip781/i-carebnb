class AddNewColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :safeguarding_check?, :boolean, default: false
    add_column :users, :charity_verified?, :boolean, default: false
    add_column :users, :supported_charities, :text
    add_column :users, :languages_spoken, :text
    add_column :users, :employment_status, :text
  end
end
