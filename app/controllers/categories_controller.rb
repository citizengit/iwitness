class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new params[:category]
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    @category.update_attributes params[:category]
    redirect_to @category
  end

  def destroy
    category = Category.find params[:id]
    category.destroy
    redirect_to categories_path, :notice => "category deleted"
  end
end
