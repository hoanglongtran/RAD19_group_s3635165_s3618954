class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)    # Not the final implementation!
    if @category.save
      #
      flash[:success] = "Category successfully created!"
      redirect_to @category
    else
      render 'new'
    end
  end

  private
    def category_params
      params.require(:category).permit(:category)
    end

end
