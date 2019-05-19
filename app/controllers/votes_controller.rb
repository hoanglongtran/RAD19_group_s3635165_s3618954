class VotesController < ApplicationController
  def create
    @vote = Vote.new(secure_params)
#    @vote.user = User.find(:user_id)
    @vote.course = Course.find(params[:course_id])
    @vote.save	
#    if @vote.save
#	respond_to do |format|
#		format.html { redirect_to  }
#		format.js
#	end
#    end

  rescue ActiveRecord::RecordInvalid => invalid
    return invalid.record.errors
  end

  def destroy
  end

  private
     def secure_params
	params.require(:vote).permit( :user_id, :vote_type )
     end
end
