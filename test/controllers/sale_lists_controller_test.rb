require 'test_helper'

class SaleListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sale_lists_index_url
    assert_response :success
  end

end
