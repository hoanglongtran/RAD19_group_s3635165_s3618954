class CoursesController < ApplicationController
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
      @courses = Course.where(:category_id => sth.id)
    elsif params[:location]
      sth = Location.find_by(:location => params[:location])
      #a = Course.joins(:courses_locations).where
      @courses = Course.includes(:locations).where(locations: { id: sth }) 
     # @courses = Course.where(:course_id => a)
    else
      @courses = Course.all
    end
  end

  def create

    @course = current_user.courses.build(course_params)

    cat = @course.category
    loc = @course.locations

    cat.courses << @course

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

#    if @course.save
#      flash[:success] = "New course added!"
#      redirect_to @course
#    else
#      render 'new'
#    end
#  end

  private
    def course_params
      params.require(:course).permit(:name, :prerequisite, :desc, :category_id, :location_ids => [])
    end

end
