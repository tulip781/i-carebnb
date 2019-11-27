class Chat < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  validates :message, presence: true
end


# self.as_html
# self.as_json...  this is what it was
