require 'test_helper'

class ProductTypeTest < ActiveSupport::TestCase
 	test "should not save type without a title" do 
  		product_type = ProductType.new
  		assert_not product_type.save, "saved the type without a title"
  	end
end
