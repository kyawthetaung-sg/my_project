require "application_system_test_case"

class IncomesTest < ApplicationSystemTestCase
  setup do
    @income = incomes(:one)
  end

  test "visiting the index" do
    visit incomes_url
    assert_selector "h1", text: "Incomes"
  end

  test "creating a Income" do
    visit incomes_url
    click_on "New Income"

    fill_in "Amount", with: @income.amount
    fill_in "Date", with: @income.date
    fill_in "Expense category", with: @income.expense_category_id
    fill_in "Note", with: @income.note
    fill_in "Payment mode", with: @income.payment_mode_id
    click_on "Create Income"

    assert_text "Income was successfully created"
    click_on "Back"
  end

  test "updating a Income" do
    visit incomes_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @income.amount
    fill_in "Date", with: @income.date
    fill_in "Expense category", with: @income.expense_category_id
    fill_in "Note", with: @income.note
    fill_in "Payment mode", with: @income.payment_mode_id
    click_on "Update Income"

    assert_text "Income was successfully updated"
    click_on "Back"
  end

  test "destroying a Income" do
    visit incomes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Income was successfully destroyed"
  end
end
