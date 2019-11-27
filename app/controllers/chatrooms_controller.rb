class ChatroomsController < ApplicationController
  def index
    @chatroom = Chatroom.new
    # @chats = Chat.all
    # @chat = Chat.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @chat = Chat.new
    if current_user != @chatroom.sender && current_user != @chatroom.recipient
      redirect_to root_path, notice: 'You are not allowed to access this chatroom'
    end
    # render json: @chatroom.chats
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:recipient_id, :sender_id)
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
