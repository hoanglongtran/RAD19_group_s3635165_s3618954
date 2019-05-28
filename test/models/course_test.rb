require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: "asdf", email: "gfd.asd@rmit.edu.au", password: "Foob@ra4", password_confirmation: "Foob@ra4")
    @location = Location.create(location: "asdf")
    @category = Category.create(category: "ghhs")
    @course = @user.courses.build(name: "something")
    @category.courses << @course
    @course.locations << @location
    @course.description = "This is a description"
    @course.save
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "user id should be present" do
    @course.user = nil
    assert_not @course.valid?
  end
end
