class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :guest
  validates :start_date, presence: true
  validates :end_date, presence: true
#   after_create :send_confirmation_message

#   def send_confirmation_message
#     Chatroom.find_or_initialize_by()
# Chatroom.find_by(recipient: current_user, sender: @user) || Chatroom.find_by(recipient: @user, sender: current_user)

#     Chat.create(
#       @chat = Chat.new(
#         message: "Thank you very much! I have booked your room for the guest(s) we work with.  Please contact me if you have any questions.  Thank you for iCaringBnB.",)

#       @chatrooms = current_user.chatrooms
#       @chat.chatroom = @chatroom
#       @chat.user = current_user

#       if @chat.save
#         Pusher.trigger('chat-channel', 'message-created', {
#           message: @chat.message,
#           sender_id: @chatroom.sender.id,
#           current_user: @chat.user.id,
#           timestamp: @chat.created_at.strftime('%I:%M %p'),
#           user_email: @chat.user.email
#         })
#         redirect_to chatroom_path(@chat.chatroom)
#       else
#         render 'chatrooms/show'
#       end
  # end


  # def self.get_bookings(rooms)
  #   @bookings = rooms.map { |r| r.bookings }
  #   @selected_bookings = @bookings.select do |booking|
  #     booking.confirmed == false && booking.declined == false
  #   end
  # end
end
