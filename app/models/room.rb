class Room < ApplicationRecord
  belongs_to :user
  validates :adult_space, presence: true, numericality: true
  validates :child_space, presence: true, numericality: true
  validates :infant_space, presence: true, numericality: true
  validates :beds, presence: true, numericality: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :facilities, inclusion: { in: ["Shared", "Private"] }
end
