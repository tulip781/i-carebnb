class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
  end

  def index
  end

  def show
    @room = Room.find(params[:id])
    if @room.public_visible
      # do something
    else
      redirect_to landing_path
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
end

# what do we want the rooms controller to do?
#   new - get the form for all of the attributes, including an image,
#   index - show all rooms that exist.
#   show - show based on search parameters
#   create - post the new room
  # edit - view the form to change the room
  # update - post the form to update the room
  # destroy - delete the room but need to build in various warnings about what the impact will be on charities.
