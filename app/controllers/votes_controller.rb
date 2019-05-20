class VotesController < ApplicationController
  def create
    @vote = Vote.new(secure_params)
#    @vote.user = User.find(:user_id)
    @vote.course = Course.find(params[:course_id])
    if @vote.save
	respond_to do |format|
		format.html { redirect_to :courses }
		format.js
	end
    end

  rescue ActiveRecord::RecordInvalid => invalid
    return invalid.record.errors
  end

  def update
	vote = Vote.find_by(user: current_user)

	vote.update_attribute(:vote_type, update_vote_params)
	redirect_to :courses
  end

  def destroy
	vote = Vote.find_by(user: current_user)
	vote.destroy
    	redirect_to :courses, :notice => 'Unvoted!'
  end

  private
     def secure_params
	params.require(:vote).permit( :user_id, :vote_type )
     end

     def update_vote_params
	params.require(:vote).permit(:vote_type)
     end
end
