class PagesController < ApplicationController

  def index
    raise params.inspect
    if !session[:address]
      @address = request.location
      if @address.longitude == '0.0' && @address.latitude == '0.0'
        #default address to get around testing environment
        @address = "608 Harris St, Sydney"
      else
        session[:address] = @address
        session[:distance] = 5
      end
    end
  end
end
