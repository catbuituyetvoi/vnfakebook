require 'test_helper'

class RelationControllerTest < ActionController::TestCase
  test "should get addFriend" do
    get :addFriend
    assert_response :success
  end

end
