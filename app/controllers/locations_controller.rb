class LocationsController < ApplicationController

  before_action :logged_in_user, only: :new  

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)    
    if @location.save
      #
      flash[:success] = "Location successfully created!"
      redirect_to courses_path
    else
      render 'new'
    end
  end

  private
    def location_params
      params.require(:location).permit(:location)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please login."
        redirect_to login_url
      end
    end


end
