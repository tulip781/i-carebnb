class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing, :search]

  def landing
  end

  def search
  @rooms = Room.all.sample(3)
  end
end
