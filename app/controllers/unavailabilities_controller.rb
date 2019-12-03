class UnavailabilitiesController < ApplicationController
  def show
  end

  def index
  end

  def edit

  end

  def create
    @room = Room.find(params[:room_id])
    @unas = params.dig(:unavailability, :date).split(',').map { |thing| Date.parse(thing) }
    @unas.each do |date|
      Unavailability.create!(date: date, room: @room)
    end
    # redirect_to dashboard_path
    @unav = @room.unavailabilities.pluck(:date).map{|d|d.strftime("%d-%m-%Y")}
    render 'rooms/edit'
  end

  def update
  end

  def destroy
  end

  def new
    @room = Room.find(params[:room_id])
    @unav = @room.unavailabilities.pluck(:date).map{|d|d.strftime("%d-%m-%Y")}
  end

  private
  def unavailability_params

  end

end
