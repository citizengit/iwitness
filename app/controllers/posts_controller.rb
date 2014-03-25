class PostsController < ApplicationController
  def index
    @posts = Post.near(session[:address], session[:distance], {:units => :km})
    session[:latitude] = Geocoder.search(session[:address])[0].latitude
    session[:longitude] = Geocoder.search(session[:address])[0].longitude

    render :layout => 'posts'

  end

  def show
    @post = Post.find params[:id]
    render :layout => 'application'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params[:post]
    @post.user_id = @current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def vote
    @post = Post.find params[:id]
    if params[:rating_up]
      @post.rating_up += params[:rating_up].to_i
    elsif params[:rating_down]
      @post.rating_down += params[:rating_down].to_i
    else
      redirect_to @post
    end
    @post.save
    redirect_to @post
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update_attributes params[:post]
    redirect_to @post
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to posts_path, :notice => "post deleted"
  end
end
