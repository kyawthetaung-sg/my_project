require 'test_helper'

class ProductSaleListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_sale_lists_index_url
    assert_response :success
  end

end
