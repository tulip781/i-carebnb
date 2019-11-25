class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_many :families, dependent: :destroy
  has_many :guests, through: :families


  # def self.get_bookings(rooms)
  #   @bookings = rooms.map { |r| r.bookings }
  #   @selected_bookings = @bookings.select do |booking|
  #     booking.confirmed == false && booking.declined == false
  #   end
  # end
end
