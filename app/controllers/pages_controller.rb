class PagesController < ApplicationController

  def index
    # check for saved address - if no saved address, get current locaton
    if !session[:address]
      # work around for how geocoder checks for addresses
      ip = request.remote_ip
      if (ip == '127.0.0.1')
        address = "608 Harris St, Sydney"
      else
        address = request.location
      end
      session[:address] = address
      session[:distance] = 5
    end
    @post = Post.new
  end
  
end
