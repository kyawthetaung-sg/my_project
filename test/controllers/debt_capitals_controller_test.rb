require 'test_helper'

class DebtCapitalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @debt_capital = debt_capitals(:one)
  end

  test "should get index" do
    get debt_capitals_url
    assert_response :success
  end

  test "should get new" do
    get new_debt_capital_url
    assert_response :success
  end

  test "should create debt_capital" do
    assert_difference('DebtCapital.count') do
      post debt_capitals_url, params: { debt_capital: { amount: @debt_capital.amount, category_id: @debt_capital.category_id, date: @debt_capital.date, note: @debt_capital.note } }
    end

    assert_redirected_to debt_capital_url(DebtCapital.last)
  end

  test "should show debt_capital" do
    get debt_capital_url(@debt_capital)
    assert_response :success
  end

  test "should get edit" do
    get edit_debt_capital_url(@debt_capital)
    assert_response :success
  end

  test "should update debt_capital" do
    patch debt_capital_url(@debt_capital), params: { debt_capital: { amount: @debt_capital.amount, category_id: @debt_capital.category_id, date: @debt_capital.date, note: @debt_capital.note } }
    assert_redirected_to debt_capital_url(@debt_capital)
  end

  test "should destroy debt_capital" do
    assert_difference('DebtCapital.count', -1) do
      delete debt_capital_url(@debt_capital)
    end

    assert_redirected_to debt_capitals_url
  end
end
