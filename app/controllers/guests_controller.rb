class GuestsController < ApplicationController
before_action :set_guest, only: [:show, :edit, :update, :destroy]
  def index
    @guests = Guest.all
  end

  def show
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    @charity = current_user.charity_supports.first.charity
    if @guest.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @guest.update(guest_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @guest.destroy
    redirect_to dashboard_path
  end

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def guest_params
    params.require(:guest).permit(:first_name, :permanent_address, :date_of_birth, :adult_space, :child_space, :infant_space, :charity_id)
  end
end
