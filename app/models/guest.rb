class Guest < ApplicationRecord
  belongs_to :charity
  has_many :bookings
end
