require 'test_helper'

class CmdsControllerTest < ActionController::TestCase
  test "should get shutdown" do
    get :shutdown
    assert_response :success
  end

  test "should get restart" do
    get :restart
    assert_response :success
  end

end
