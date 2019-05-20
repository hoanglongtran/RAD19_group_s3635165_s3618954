class CoursesController < ApplicationController
  def new
    @courses = Course.new
  end

  def show
    @courses = Course.find(params[:id])
  end

  def index
    @users = User.all
    if params[:category]
      sth = Category.find_by(:category => params[:category])
      @courses = Course.where(:category_id => sth)

      @courses = Course.where(:category_id => sth.id)
    elsif params[:location]
      sth = Location.find_by(:location => params[:location])
      #a = Course.joins(:courses_locations).where
      @courses = Course.includes(:locations).where(locations: { id: sth }) 
     # @courses = Course.where(:course_id => a)
    else
      @courses = Course.all
    end
    
#    @user_name = @courses.user_id.name 
  end



end