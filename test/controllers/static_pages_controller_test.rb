require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get policy" do
    get :policy
    assert_response :success
  end

end
