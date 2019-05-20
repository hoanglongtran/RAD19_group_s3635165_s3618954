class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)    # Not the final implementation!
    if @location.save
      #
      flash[:success] = "Location successfully created!"
      redirect_to @location
    else
      render 'new'
    end
  end

  private
    def location_params
      params.require(:location).permit(:location)
    end


end
