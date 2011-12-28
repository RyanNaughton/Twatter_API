require 'test_helper'

class Users::TweetsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "get index" do
  	get :index, :user_id => users(:bob).name
  	json = JSON.parse(response.body)
  	assert(json.first["message"] == users(:bob).tweets.first.message)
  end
  	
  test "post create" do
  	post :create, :user_id => users(:bob).name, :tweet => {:message => "Test Message"}
  	assert(users(:bob).tweets.last.message == "Test Message")	
  end
  
  test "DNE" do
  	assert_raise(ActiveRecord::RecordNotFound) do 
  		get :index, :user_id => "123"
  	end
  end
  
  test "post create failure" do
  	post :create, :user_id => users(:bob).name, :tweet => {:message => "1"*141}
  	puts response.status
  	assert(response.status == 400)	
  end
  
  
  	
  	
end
