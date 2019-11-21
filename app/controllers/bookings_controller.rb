class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :confirmed]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to dashboard_path
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  def confirmed
    @booking.confirmed = true
    @booking.save
    redirect_to dashboard_path
  end

private

  def booking_params
    params.require(:booking).permit(:number_of_adults, :number_of_children, :number_of_infants, :start_date, :end_date, :room_id)
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
