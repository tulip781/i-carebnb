class Charity < ApplicationRecord
  has_many :guests, dependent: :destroy
  has_many :charity_supports, dependent: :destroy
  has_many_attached :photos
  has_many :users, through: :charity_supports
end
