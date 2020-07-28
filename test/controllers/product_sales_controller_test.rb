require 'test_helper'

class ProductSalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_sales_index_url
    assert_response :success
  end

end
