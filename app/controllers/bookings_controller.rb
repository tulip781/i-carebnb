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
    # @dates = params[:booking]['range_dates'].split(' to ')
    @start_date = params[:booking][:start_date]
    @end_date = params[:booking][:end_date]
    # @dates.map! { |d| Date.parse(d) }
    @booking.start_date = @start_date
    @booking.end_date = @end_date
    @booking.user = current_user
    @booking.guest = Guest.all.sample
    @room = Room.find(params[:room_id])
    @unav = @room.unavailabilities.pluck(:date).map{|d|d.strftime("%d-%m-%Y")}
    @booking.room = @room
    if @start_date.present? && @end_date.present?
      @dates_array = (@start_date..@end_date).to_a
      unless @booking.room.available_on?(@dates_array)
        render(html: "<script>alert('Room is not available on those dates')</script>".html_safe)
      end
    end
    if @booking.save
      @dates_array.each do |date|
        @unavailability = Unavailability.create(room: @booking.room, date: date)
      end
      redirect_to dashboard_path
    else
      render 'rooms/show'
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
    send_confirmation_message
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

  def send_confirmation_message

    @chatroom = Chatroom.find_by(recipient: @booking.user, sender: @booking.room.user) || Chatroom.find_by(recipient: @booking.room.user, sender: @booking.user)
    unless @chatroom
      @chatroom = Chatroom.new
      @chatroom.sender = @booking.room.user
      @chatroom.recipient = @booking.user
      @chatroom.save
    end
    if @chatroom.sender != current_user
      @interlocutor = @chatroom.sender
    else
      @interlocutor = @chatroom.recipient
    end
      @chat = Chat.new(message: "Thank you very much! I am happy to confirm the booking request you have made.  Please contact me if you have any questions.  Thank you for iCaringBnB.")
      @chat.chatroom = @chatroom
      @chat.user = current_user
      if @chat.save
        Pusher.trigger('chat-channel', 'message-created', {
          message: @chat.message,
          sender_id: @chatroom.sender.id,
          recipient_id: @chatroom.recipient_id,
          interlocutor: @interlocutor,
          current_user: @chat.user.id,
          timestamp: @chat.created_at.strftime('%I:%M %p'),
          user_email: @chat.user.email
        })
      end
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
