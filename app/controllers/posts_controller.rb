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
    case params[:sort_by]
    when 'popular'
      @posts = Post.order('rating_up ASC')
    when 'debunked'
      @posts = Post.order('rating_down ASC')
    when 'latest'
      @posts = Post.all.sort
    when 'oldest'
      @posts = Post.all.sort.reverse
    when 'closest'
      @posts = Post.near(session[:address])
    when 'furthest'
      @posts = Post.near(session[:address]).reverse
    when 'alphabetical'
      @posts = Post.order('title ASC')
    else
      @posts = Post.all.sort
    end
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
    if params[:rating_up]
      @post.rating_up == nil ? ( @post.rating_up = 1 ) : ( @post.rating_up += 1 )
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
