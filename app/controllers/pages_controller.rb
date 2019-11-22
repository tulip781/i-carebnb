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
  end

  def switch_login
    session[:guest] = !session[:guest]
    redirect_to(request.env['HTTP_REFERER'])
  end

end
