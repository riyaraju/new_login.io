require 'test_helper'

class UserProfilesControllerTest < ActionDispatch::IntegrationTest

include Devise::Test::IntegrationHelpers

def setup
    @user = users(:one)
  end

  test "signed in user is redirected to root_path" do
  	get user_session_path
    sign_in @user
    get '/'
    assert_response :success
  end


  test "should updates users succesfully" do
  	sign_in @user
  	get '/user_profiles/1/edit' 
  	assert_equal "admin", @user.role
    patch '/user_profiles/1', params: {user: {username: "xxx", email: "xxx@sample.com", age: 43, phone_number: "8765432123" }}
    assert_redirected_to '/user_profiles/list'
    @user.reload
    assert_equal "xxx", @user.username  
  end

end
