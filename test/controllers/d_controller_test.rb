require 'test_helper'

class DControllerTest < ActionController::TestCase
  test "should get new:post" do
    get :new:post
    assert_response :success
  end

end
