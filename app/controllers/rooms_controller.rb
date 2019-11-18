class RoomsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def new
  end

  def index
  end

  def show
    @room = Room.find(params[:id])
    if @room.public_visible
      # do something
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
end
