class DeleteColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
      remove_column :users, :start_date, :date
      remove_column :users, :end_date, :date
      add_column :bookings, :start_date, :date
      add_column :bookings, :end_date, :date
  end
end
