require 'test_helper'

class TagTest < ActiveSupport::TestCase
	test "should not save tags without titles" do 
  		tag = Tag.new
  		assert_not tag.save, "saved the tag without a title"
  	end
end
