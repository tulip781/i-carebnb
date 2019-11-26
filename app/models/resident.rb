class Resident < ApplicationRecord
  belongs_to :room
  has_many :safeguardings, dependent: :destroy
end
