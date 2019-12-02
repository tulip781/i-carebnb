class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :confirmed, :declined]

  def index
    @bookings = Booking.all
  end

  def show
    @markers =
      [{
        image_url: helpers.asset_url('mapbox-icare.svg'),
        lat: @booking.room.latitude,
        lng: @booking.room.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { room_address: @booking.room.address })
      }]
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @dates = params['range_dates'].split(' to ')
    @dates.map! { |d| Date.parse(d) }
    @booking.start_date = @dates[0]
    @booking.end_date = @dates[1]

    @booking.user = current_user
    @booking.guest = Guest.all.sample
    @booking.room = Room.find(params[:room_id])
    @dates_array = (@dates[0]..@dates[1]).to_a
    if @booking.room.available_on?(@dates_array)
      @booking.save
      redirect_to dashboard_path
    else
      render(html: "<script>alert('Room is not available on those dates')</script>".html_safe)

    end
    @dates_array.each do |date|
      @unavailability = Unavailability.create(room: @booking.room, date: date)
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  def confirmed
    @booking.confirmed = true
    @booking.save
    redirect_to dashboard_path
  end

  def declined
    if @booking.declined == false
      @booking.declined = true
    else
      @booking.declined = false
    end
    @booking.save
    redirect_to dashboard_path
  end

private

  def booking_params
    params.require(:booking).permit(:number_of_adults, :number_of_children, :number_of_infants, :guest_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end

# booking should only happen when the host confirms the booking sent to it by the charity.

# check if user is the charity rep or the host
# if it is the charity rep, it can initiate the booking, filling in all of the fields
# can send it to the host.  one of the attributes it sends to the host is the actual host details and the appartment which
# needs to match the host receiving the booking
# host is in control of creation of the booking, so it triggers the create method.

# pseudo code:
#
