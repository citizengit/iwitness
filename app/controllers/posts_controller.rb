class PostsController < ApplicationController

  layout "posts", :only => :index
  layout "application" , :except => :index

  before_filter :check_if_logged_in, :except => [:show, :index, :all]

  def index
    @posts = Post.near(params[:address], params[:distance], {:units => :km})
    #session[:latitude] = Geocoder.search(session[:address])[0].latitude
    #session[:longitude] = Geocoder.search(session[:address])[0].longitude
    pinpoint = Geocoder.search(params[:address])[0]
    @latitude = pinpoint.latitude
    @longitude = pinpoint.longitude
    @distance = params[:distance]
  end

  def all
    @title = params[:sort_by]
    @posts = Post.sort_posts(@title)
    #When possible take the logic out of the controller and put it in the model; 
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params[:post]
    @post.user_id = @current_user.id
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def vote
    @post = Post.find params[:id]
    session[:posts_voted] << @post.id
    if params[:rating_up]
      @post.rating_up == nil ? ( @post.rating_up = 1 ) : ( @post.rating_up += 1 )
      #To avoid this ternary operatory, when you create a new post you could assign rating_up and rating_down a value of 0; 
    elsif params[:rating_down]
      @post.rating_down == nil ? ( @post.rating_down = 1 ) : ( @post.rating_down += 1 )
    else
      redirect_to @post
    end
    @post.save
    flash[:notice] = "Thanks for your vote"
    redirect_to @post
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if params[:post]["remove_image"] == "1"
      @post.remove_image!
    end
    @post.update_attributes params[:post]
    redirect_to @post
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to posts_path, :notice => "post deleted"
  end

  private
  def check_if_logged_in
    redirect_to(root_path) if @current_user.nil?
  end
  
  def check_if_admin
    redirect_to(root_path) if @current_user.nil? || @current_user.admin == false
  end

end
