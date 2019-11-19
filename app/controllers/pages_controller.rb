class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing, :search, :about]

  def landing
  end

  def search
  @rooms = Room.all.sample(3)
  end

  def about
  end
end
