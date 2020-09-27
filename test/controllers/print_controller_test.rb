require 'test_helper'

class PrintControllerTest < ActionDispatch::IntegrationTest
  test "should get sale_lists_print" do
    get print_sale_lists_print_url
    assert_response :success
  end

end
