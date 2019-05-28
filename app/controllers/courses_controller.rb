class CoursesController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def index
    @users = User.all
    if params[:category]
      category = Category.find_by(:category => params[:category])
      @courses = Course.includes(:categories).where(categories: { id: category })
    elsif params[:location]
      location = Location.find_by(:location => params[:location])
      @courses = Course.includes(:locations).where(locations: { id: location })
    else
      @courses = Course.all
    end
  end

  def create
    @course = current_user.courses.build(course_params)
    if @course.save
       flash[:success] = "Course successfully created!"
       redirect_to @course
    else
       render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
       flash[:success] = "Course successfully updated!"
       redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course deleted."
    redirect_to courses_path
  end

  private
    def course_params
      params.require(:course).permit(:picture, :name, :prerequisite, :description, :category_ids => [], :location_ids => [])
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please login."
        redirect_to login_url
      end
    end

    def correct_user
       @course = Course.find(params[:id])
       @user = @course.user
       redirect_to(root_url) unless current_user?(@user) || current_user.admin?
     end

     def admin_user
       redirect_to(root_url) unless current_user.admin?
     end

end
