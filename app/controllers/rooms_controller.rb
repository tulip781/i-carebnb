class RoomsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_room, only: [:edit, :update, :destroy]

  def new
    @room = Room.new
  end

  def index
    @room = Room.all
  end

  def show
    if @room.public_visible
      @room = Room.find(params[:id])

    else
      redirect_to home_path
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def room_params
    params.require(:room).permit(:adult_space, :child_space, :infant_space, :beds, :max_stay_length, :availability, :public_visible)
  end

  def set_room
        @room = Room.find(params[:id])
  end
end


# what do we want the rooms controller to do?
#   new - get the form for all of the attributes, including an image,
#   index - show all rooms that exist.
#   show - show based on search parameters
#   create - post the new room
  # edit - view the form to change the room
  # update - post the form to update the room
  # destroy - delete the room but need to build in various warnings about what the impact will be on charities.
