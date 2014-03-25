class SessionController < ApplicationController

  def index
    if params[:address]
      session[:address] = params[:address]
      session[:distance] = params[:distance]
      redirect_to posts_path
    else
      session[:address] = nil
      flash[:notice] = "Please enter a location"
      redirect_to root_path
    end
    session[:latitude] = Geocoder.search(session[:address])[0].latitude
    session[:longitude] = Geocoder.search(session[:address])[0].longitude
  end

  def new
    flash[:attention] = "attention"
    redirect_to root_path
  end

  def create
    user = User.where(:name => params[:name]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      session[:user_id] = nil
      flash[:notice] = "Incorrect username or password, please try again."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end