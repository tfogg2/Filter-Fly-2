require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  	test "should not save category without a title" do 
  		category = Category.new
  		assert_not category.save, "saved the category without a title"
  	end

  	test "test number of categories" do
  		category = Category.count
  		assert_not category > 1000, "more than 1000 categories"
  	end

  	test "ID as integer" do 
  		
	end 
end