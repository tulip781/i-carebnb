class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing, :search, :about]

  def landing
  end

  def search
    @rooms = Room.all.sample(3)
  end

  def about
  end

  def dashboard
    # @counter = 0
    # @chatroom.sender.chats.each do |chat|
    # if chat.read == false
    # @counter += 1
    # end
    # end
    @rooms = current_user.rooms
    @bookings = current_user.rooms.map { |room| room.bookings }.flatten
    @booking_requests = @bookings.select { |booking| booking.confirmed == false && booking.declined == false }
    # @requests = Booking.get_bookings(@rooms)
    @charity_confirmed_bookings = current_user.bookings.where(confirmed: true)
    @charity_declined_bookings = current_user.bookings.where(declined: true)
    @charity_pending_bookings = current_user.bookings.select { |booking| booking.confirmed == false && booking.declined == false }
    # raise
  end

  def switch_login
    session[:guest] = !session[:guest]
    redirect_to(request.env['HTTP_REFERER'])
  end
end
