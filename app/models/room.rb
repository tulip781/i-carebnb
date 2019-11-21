class Room < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  validates :adult_space, presence: true, numericality: true
  validates :child_space, presence: true, numericality: true
  validates :infant_space, presence: true, numericality: true
  validates :beds, presence: true, numericality: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :facilities, inclusion: { in: ["Shared", "Private"] }
  validates :title, presence: true
end
