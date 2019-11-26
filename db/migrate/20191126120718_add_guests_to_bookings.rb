class AddGuestsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :guest, index: true
  end
end
