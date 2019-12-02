class Chatroom < ApplicationRecord
  has_many :chats
  belongs_to :recipient, foreign_key: 'recipient_id', class_name: 'User'
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'
  validates :recipient, uniqueness: { scope: :sender, message: "Chat with another User!" }

      #   after_create :notify_pusher

      # def notify_pusher
      #   Pusher.trigger('chat-channel', 'message-created', self.as_json)
      # end

end

# belongs to hear actually creates a method. This allows you to change from the class to the method.
