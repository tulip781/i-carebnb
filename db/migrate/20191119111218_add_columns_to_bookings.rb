class AddColumnsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :confirmed, :boolean, default: false
    add_column :bookings, :host_control, :boolean, default: true
    add_column :bookings, :number_of_adults, :integer
    add_column :bookings, :number_of_children, :integer
    add_column :bookings, :number_of_infants, :integer
  end
end
