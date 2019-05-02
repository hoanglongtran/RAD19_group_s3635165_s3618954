class CoursesController < ApplicationController
  def new
    @courses = Course.new
  end

  def show
    @courses = Course.find(params[:id])
  end

  def index
    if params[:category]
      sth = Category.find_by(:category => params[:category])
      @courses = Course.where(:category_id => sth)
    else
      @courses = Course.all
    end
  end
end
