class ChatsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def create
    @chat = Chat.new(chat_params)
    respond_to do |format|
      if @chat.save
        # format.html { redirect_to chatroom_path(@chat) }
        format.json { render :show, status: :created, location: @chat }
      else
        # format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @chat = Chat.new
  end

  def show
    @chats = Chat.where(chatroom_id: params[:id])
    respond_to do |format|
      if @chats
        format.json { render :chats, status: :ok }
      else
        format.json { render json: @chats.errors, status: :unprocessable_entity }
      end
    end
  end

  # def show
  #     @chats = Chat.where(chatroom_id: params[:id])
  #     respond_to do |format|
  #       if @chats
  #         format.html do
  #           redirect_to '/'
  #         end
  #         format.json { render :chats, status: :ok }
  #       else
  #         format.html { render 'new'}
  #         format.json { render json: @chats.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   end

  private

  def chat_params
    params.require(:chat).permit(:message, :name, :chatroom_id)
  end
end


# def create
#   ...
#   respond_to do |format|
#     if @reservation.save
#       format.html do
#         redirect_to '/'
#       end
#       format.json { render json: @reservation.to_json }
#     else
#       format.html { render 'new'} ## Specify the format in which you are rendering "new" page
#       format.json { render json: @reservation.errors } ## You might want to specify a json format as well
#     end
#   end
# end
