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
	vote = Vote.find_by(user: current_user, course: Course.find(params[:course_id]))
	vote.update_attribute(:vote_type, update_vote_params[:vote_type])
	redirect_to :courses
  end

  def destroy
      vote = Vote.find_by(user: current_user, course: Course.find(params[:course_id]))
      vote.destroy
      redirect_to :courses, :notice => 'Unvoted!'
  end

  def remove_all
    votes = Vote.find_by(course: params[:course_id])
      votes.destroy
    redirect_to :courses, :notice => 'Votes reset!'
  end

  private
     def secure_params
	params.require(:vote).permit( :user_id, :vote_type )
     end

     def update_vote_params
	params.require(:vote).permit(:vote_type)
     end
end
