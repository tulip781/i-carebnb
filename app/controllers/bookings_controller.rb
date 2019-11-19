class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @booking = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_show_path(@booking)
      # check path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_show_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to root_path

  end

private

  def booking_params
    params.require(:booking).permit(:user_id, :room_id, :adults, :children, :infants, :start_date, :end_date, :submit, :confirmed)
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
