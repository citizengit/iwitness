class PagesController < ApplicationController

  def index
    if !session[:address]
      @address = request.location
      if @address.include? "Geocoder"
        #default address to get around testing environment
        @address = "608 Harris St, Sydney"
      else
        session[:address] = @address
        session[:distance] = 5
      end
    end
  end
end
