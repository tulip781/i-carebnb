class RoomsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_room, only: [:edit, :show, :update, :destroy]

  def index
    default_radius = 30

    # @search_location = [51.5156177, -0.0919983]
    if params[:location].present? && params[:radius].present? && params['range_dates'].present?
      @search_location = Geocoder.search(params[:location]).first.coordinates

      @dates = params['range_dates'].split(' to ')
      dates = ((Date.parse(@dates[0]))..(Date.parse(@dates[1]))).to_a
      @rooms = Room.near(params[:location], params[:radius])
      @rooms = @rooms.where("adult_space >= ?
                             AND child_space >= ?
                             AND infant_space >= ?",
                             params[:adults].to_i,
                             params[:children].to_i,
                             params[:infants].to_i)
      @rooms = @rooms.select { |room| room.available_on?(dates) }

      # @rooms = @rooms.select do |room|
      #   params[:adults].to_i <= room.adult_space &&
      #     params[:children].to_i <= room.child_space &&
      #     params[:infants].to_i <= room.infant_space &&
      #     @total_beds <= room.beds
        # params[:minimum_stay].to_i <= room.max_stay_length
      # end

    elsif params[:location].present? && params[:radius].present?
      @search_location = Geocoder.search(params[:location]).first.coordinates

      @rooms = Room.near(params[:location], params[:radius])
      @rooms = @rooms.where("adult_space >= ?
                             AND child_space >= ?
                             AND infant_space >= ?",
                             params[:adults].to_i,
                             params[:children].to_i,
                             params[:infants].to_i)
        # params[:minimum_stay].to_i <= room.max_stay_length

    elsif params[:location].present?
      @search_location = Geocoder.search(params[:location]).first.coordinates

      @rooms = Room.near(params[:location], default_radius)

      @rooms = @rooms.where("adult_space >= ?
                             AND child_space >= ?
                             AND infant_space >= ?",
                             params[:adults].to_i,
                             params[:children].to_i,
                             params[:infants].to_i)
    elsif
      Geocoder.search(request.location.data["ip"]).first.coordinates.empty? != true
      @search_location = Geocoder.search(request.location.data["ip"]).first.coordinates
      @rooms = Room.near(@search_location, 1000)
    # elsif
    #   Geocoder.search(current_user[:address]).empty? != true
    #   @search_location = Geocoder.search(current_user[:address]).first.coordinates
    #   @rooms = Room.near(@search_location, 1000)
    else
      @search_location = Geocoder.search("London").first.coordinates
      @rooms = Room.near(@search_location, 1000)
      # @rooms = Room.geocoded

      @rooms = @rooms.where("adult_space >= ?
                             AND child_space >= ?
                             AND infant_space >= ?",
                             params[:adults].to_i,
                             params[:children].to_i,
                             params[:infants].to_i)
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
    if params[:location]
      @search_location = Geocoder.search(params[:location]).first.coordinates
    elsif
      Geocoder.search(request.location.data["ip"]).first.coordinates.empty? != true
      @search_location = Geocoder.search(request.location.data["ip"]).first.coordinates
    # elsif
    #   Geocoder.search(current_user[:address]).empty? != true
    #   @search_location = Geocoder.search(current_user[:address]).first.coordinates
    else
      @search_location = Geocoder.search("London").first.coordinates
    end
    @unav = Room.find(params[:id].to_i).unavailabilities.pluck(:date).map{|d|d.strftime("%d-%m-%Y")}
  # raise

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
    @unav = @room.unavailabilities.pluck(:date).map { |d| d.strftime("%d-%m-%Y") }
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
