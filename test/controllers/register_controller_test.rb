require 'test_helper'

class RegisterControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
