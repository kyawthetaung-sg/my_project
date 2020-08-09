require 'test_helper'

class PaymentModesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_mode = payment_modes(:one)
  end

  test "should get index" do
    get payment_modes_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_mode_url
    assert_response :success
  end

  test "should create payment_mode" do
    assert_difference('PaymentMode.count') do
      post payment_modes_url, params: { payment_mode: { name: @payment_mode.name } }
    end

    assert_redirected_to payment_mode_url(PaymentMode.last)
  end

  test "should show payment_mode" do
    get payment_mode_url(@payment_mode)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_mode_url(@payment_mode)
    assert_response :success
  end

  test "should update payment_mode" do
    patch payment_mode_url(@payment_mode), params: { payment_mode: { name: @payment_mode.name } }
    assert_redirected_to payment_mode_url(@payment_mode)
  end

  test "should destroy payment_mode" do
    assert_difference('PaymentMode.count', -1) do
      delete payment_mode_url(@payment_mode)
    end

    assert_redirected_to payment_modes_url
  end
end
