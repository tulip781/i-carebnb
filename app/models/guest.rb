class Guest < ApplicationRecord
  belongs_to :charity
  has_many :families, dependent: :destroy
  has_many :bookings, through: :families
end
