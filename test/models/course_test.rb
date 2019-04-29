require 'test_helper'

class CoursetTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "michael", email: "hoakh.khg@rmit.edu.au")
    @location = Location.new(location: "12.123.51")
    @category = Category.new(category: "123123")
    # This code is not idiomatically correct.
    @course = @user.courses.build(name: "iOS Dev", location: @location.id, category: @category.id, user_id: @user.id)
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "user id should be present" do
    @course.user_id = nil
    assert_not @course.valid?
  end
end
