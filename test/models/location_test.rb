require 'test_helper'

class LocationTest < ActiveSupport::TestCase
    def setup
          @location = Location.create(location: "Everest")
     end
 
     test "should be vaild" do
         assert @location.valid?
     end
 
     test "name should be present" do
         @location.location = "     "
         assert_not @location.valid?
     end

end
