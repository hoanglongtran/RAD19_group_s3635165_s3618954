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

  def create
    @course = current_user.courses.build(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: "Course successfully created!" }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    respond_to do |format|
      if @course.update_attributes(course_params)
        format.html { redirect_to @course, notice: "Course successfully updated!" }
        format.json { render :show, status: :updated, location: @course }
      else
        render 'edit'
      end
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to courses_path
  end

  private
    def course_params
      params.require(:course).permit(:name, :prerequisite, :description, :category_id, :location_ids => [])
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
