class Room < ApplicationRecord
  geocoded_by :address
  has_one_attached :photo
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  before_validation :calculate_beds

  has_many :residents, dependent: :destroy
  has_many :unavailabilities, dependent: :destroy

  validates :adult_space, presence: true, numericality: true
  validates :child_space, presence: true, numericality: true
  validates :infant_space, presence: true, numericality: true
  validates :beds, presence: true, numericality: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :facilities, inclusion: { in: ["Shared", "Private"] }

  def photo_url_or_default
    if photo.attached?
      photo.key
    else
      "default_v9rlap"
    end
  end

  def calculate_beds
    self[:beds] = adult_space + child_space + infant_space
  end

  def available_on?(dates)
    dates.each do |date|
      return false if unavailabilities.find_by(date: date)
    end
    return true
  end
end
