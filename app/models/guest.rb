class Guest < ApplicationRecord
  belongs_to :charity
  has_many :families
  has_many :bookings, through: :families
end
