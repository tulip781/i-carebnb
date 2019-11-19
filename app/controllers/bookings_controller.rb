class BookingsController < ApplicationController
  def index
  end

  def show
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


# booking should only happen when the host confirms the booking sent to it by the charity.

# check if user is the charity rep or the host
# if it is the charity rep, it can initiate the booking, filling in all of the fields
# can send it to the host.  one of the attributes it sends to the host is the actual host details and the appartment which
# needs to match the host receiving the booking
# host is in control of creation of the booking, so it triggers the create method.
