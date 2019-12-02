class Chat < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  validates :message, presence: true
  # after_create :notify_pusher


  # def notify_pusher
  #   Pusher.trigger('chat-channel', 'message-created', self.as_json)
  # end

end
