require 'test_helper'

class AjaxControllerTest < ActionDispatch::IntegrationTest
  test "should get get_active_products" do
    get ajax_get_active_products_url
    assert_response :success
  end

end
