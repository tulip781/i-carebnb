class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :start_date
    remove_column :users, :end_date
  end
end
