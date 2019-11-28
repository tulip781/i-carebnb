class ChatroomsController < ApplicationController
  def index
    @chatroom = Chatroom.new
    # @chats = Chat.all
    # @chat = Chat.new
  end

  def create
    @user = User.find(params[:user_id])
    @chatroom = Chatroom.find_by(recipient: current_user, sender: @user) || Chatroom.find_by(recipient: @user, sender: current_user)
    unless @chatroom
      @chatroom = Chatroom.new
      @chatroom.sender = current_user
      @chatroom.recipient = @user
      @chatroom.save
    end
    redirect_to chatroom_path(@chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = current_user.chatrooms
    @chat = Chat.new
    if current_user != @chatroom.sender && current_user != @chatroom.recipient
      redirect_to root_path, notice: 'You are not allowed to access this chatroom'
    end
    # render json: @chatroom.chats
  end
end

# chatroom params - where do i go about building in username
# create_table "chatrooms", force: :cascade do |t|
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.integer "sender_id"
#     t.integer "recipient_id"
#     t.index ["recipient_id"], name: "index_chatrooms_on_recipient_id"
#     t.index ["sender_id", "recipient_id"], name: "index_chatrooms_on_sender_id_and_recipient_id", unique: true
#     t.index ["sender_id"], name: "index_chatrooms_on_sender_id"
#   end
