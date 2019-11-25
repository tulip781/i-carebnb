class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  # def self.get_bookings(rooms)
  #   @bookings = rooms.map { |r| r.bookings }
  #   @selected_bookings = @bookings.select do |booking|
  #     booking.confirmed == false && booking.declined == false
  #   end
  # end
end
