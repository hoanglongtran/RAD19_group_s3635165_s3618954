require 'test_helper'

class VoteTest < ActiveSupport::TestCase
def setup
          @user = User.new(name: "Example User", email: "user.lastname@rmit.edu.au", password: "Foob@ra4", password_confirmation: "Foob@ra4")
	@location = Location.create(location: "asdf")
     	@category = Category.create(category: "ghhs")
     	@course = @user.courses.build(name: "something")
     	@course.locations << @location
     	@course.categories << @category
     	@course.description = "This is a description"
     	@course.save

	@vote = Vote.new(user: @user, course: @course, vote_type: 1)
	@vote.save
   end


   test "should be valid" do
	assert @vote.valid?
   end

end
