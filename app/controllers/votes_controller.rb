class VotesController < ApplicationController
  def create
    @vote = Vote.new(secure_params)
    @vote.course = Course.find(params[:course_id])
    if @vote.save
	respond_to do |format|
		format.html { redirect_to @vote.post }
		format.js
	end
    end 
  end

  def destroy
  end

  private
     def secure_params
	params.permit(:course_id, :user, :vote_type)
     end
end
