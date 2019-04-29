class CoursesController < ApplicationController
  def new
    @courses = Course.new
  end

  def show
    @courses = Course.find(params[:id])
  end

  def index
    @courses = Course.all
  end
end
