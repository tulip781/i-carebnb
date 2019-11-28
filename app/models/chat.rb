class Chat < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  validates :message, presence: true
end
