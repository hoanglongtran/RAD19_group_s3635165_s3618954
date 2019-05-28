class CategoriesController < ApplicationController

  before_action :logged_in_user, only: :new


  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)    
    if @category.save
      #
      flash[:success] = "Category successfully created!"
      redirect_to courses_path
    else
      render 'new'
    end
  end

  private
    def category_params
      params.require(:category).permit(:category)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please login."
        redirect_to login_url
      end
    end


end
