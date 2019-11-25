class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :families
  has_many :guests, through: :families
end
