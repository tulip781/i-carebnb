class Charity < ApplicationRecord
  has_many :guests, dependent: :destroy
  has_many :charity_supports, dependent: :destroy
  has_many_attached :photos
  has_many :users, through: :charity_supports
  after_create :make_dummy_guest

  def make_dummy_guest
    Guest.create(
      first_name: "Details to be provided later",
      child_space: 0,
      adult_space: 1, charity: self)
  end
end
