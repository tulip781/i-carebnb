class Guest < ApplicationRecord
  belongs_to :charity
  has_many :bookings
  has_one_attached :photo
  validates :first_name, presence: true

  def name
    first_name
  end

  def photo_url_or_default
    if photo.attached?
      photo.key
    else
      "icare_logo.svg"
    end
  end
end
