class Guest < ApplicationRecord
  belongs_to :charity
  has_many :bookings

  def name
    first_name
  end
end
