class Room < ApplicationRecord
  belongs_to :user
  validates :adult_space, presence: true
  validates :child_space, presence: true
  validates :infant_space, presence: true
  validates :beds, presence: true
  validates :address, presence: true
end
