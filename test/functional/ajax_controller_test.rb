require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get create_user" do
    get :create_user
    assert_response :success
  end

end
