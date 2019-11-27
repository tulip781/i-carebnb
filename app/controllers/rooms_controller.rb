class RoomsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_room, only: [:edit, :show, :update, :destroy]

  def index

    default_radius = 30
    if params[:location].present? && params[:radius].present?
      @rooms = Room.near(params[:location], params[:radius])

      @rooms = @rooms.select do |room|
        params[:adults].to_i <= room.adult_space &&
        params[:children].to_i <= room.child_space &&
        params[:infants].to_i <= room.infant_space &&
        params[:beds].to_i <= room.beds
        # params[:minimum_stay].to_i <= room.max_stay_length
      end


    elsif params[:location].present?
      @rooms = Room.near(params[:location], default_radius)

      @rooms = @rooms.select do |room|
        params[:adults].to_i <= room.adult_space &&
        params[:children].to_i <= room.child_space &&
        params[:infants].to_i <= room.infant_space &&
        params[:beds].to_i <= room.beds
      end
    else
      @rooms = Room.geocoded

      @rooms = @rooms.select do |room|
        params[:adults].to_i <= room.adult_space &&
        params[:children].to_i <= room.child_space &&
        params[:infants].to_i <= room.infant_space &&
        params[:beds].to_i <= room.beds
        # params[:minimum_stay].to_i <= room.max_stay_length
      end
    end


    @markers = @rooms.map do |room|
      {
        image_url: helpers.asset_url('mapbox-icare.svg'),
        lat: room.latitude,
        lng: room.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { room: room })
      }

    end

  end

  def show
    @booking = Booking.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @unav = @room.unavailabilities.pluck(:date).map{|d|d.strftime("%Y-%m-%d")}
  end

  def update
    if @room.update(room_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to dashboard_path
  end

  private

  def room_params
    params.require(:room).permit(:adult_space, :child_space, :infant_space, :beds, :max_stay_length, :postcode, :address, :title, :image_url, :description, :facilities, :photo)
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
