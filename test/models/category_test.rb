require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  	test "should not save category without a title" do 
  		category = Category.new
  		assert_not category.save, "saved the category without a title"
  	end

end
