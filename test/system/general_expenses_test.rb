require "application_system_test_case"

class GeneralExpensesTest < ApplicationSystemTestCase
  setup do
    @general_expense = general_expenses(:one)
  end

  test "visiting the index" do
    visit general_expenses_url
    assert_selector "h1", text: "General Expenses"
  end

  test "creating a General expense" do
    visit general_expenses_url
    click_on "New General Expense"

    fill_in "Amount", with: @general_expense.amount
    fill_in "Category", with: @general_expense.category_id
    fill_in "Date", with: @general_expense.date
    fill_in "Note", with: @general_expense.note
    click_on "Create General expense"

    assert_text "General expense was successfully created"
    click_on "Back"
  end

  test "updating a General expense" do
    visit general_expenses_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @general_expense.amount
    fill_in "Category", with: @general_expense.category_id
    fill_in "Date", with: @general_expense.date
    fill_in "Note", with: @general_expense.note
    click_on "Update General expense"

    assert_text "General expense was successfully updated"
    click_on "Back"
  end

  test "destroying a General expense" do
    visit general_expenses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "General expense was successfully destroyed"
  end
end
