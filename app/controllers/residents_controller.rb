class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update, :destroy]
  def index
    @residents = Resident.all
  end

  def show
  end

  def new
    @resident = Resident.new
  end

  def create
    @resident = Resident.new(resident_params)
    if @resident.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @resident.update(resident_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @resident.destroy
    redirect_to dashboard_path
  end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end

  def resident_params
    params.require(:resident).permit(:first_name, :last_name, :date_of_birth, :safeguarding_check?, :room_id, :gender)
  end
end
