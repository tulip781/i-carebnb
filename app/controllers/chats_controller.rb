class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    @chat = Chat.new
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chat.chatroom = @chatroom
    @chat.user = current_user
    if @chat.save
      Pusher.trigger('chat-channel', 'message-created', {
        message: @chat.message,
        recipient_id: @chat.chatroom.recipient.id,
        sender_id: @chat.chatroom.sender.id,
        current_user: current_user.id
      })
      # this is the data that is referred to in the view, which is being bound up for the channel
      # redirect_to chatroom_path(@chat.chatroom)
    else
      render 'chatrooms/show'
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end


# create_table "chats", force: :cascade do |t|
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "user_id"
#     t.text "message"
#     t.integer "chatroom_id"
#     t.index ["user_id"], name: "index_chats_on_user_id"
#   end
