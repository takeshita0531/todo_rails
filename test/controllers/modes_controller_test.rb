require 'test_helper'

class ModesControllerTest < ActionDispatch::IntegrationTest
  test "should get filter:string" do
    get modes_filter:string_url
    assert_response :success
  end

end
