require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    def setup
        @category = Category.create(category: "iOS Dev") 
    end

    test "should be vaild" do
        assert @category.valid?
    end

    test "name should be present" do
        @category.category = "     "
        assert_not @category.valid?
    end
end
