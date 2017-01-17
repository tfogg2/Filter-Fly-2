require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
	get "/"
  end

  test "can see the index collections page" do 
  	get "/index"
  	# assert "Shop" = 
  end
end
