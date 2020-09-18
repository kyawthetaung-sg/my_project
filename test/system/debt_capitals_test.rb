require "application_system_test_case"

class DebtCapitalsTest < ApplicationSystemTestCase
  setup do
    @debt_capital = debt_capitals(:one)
  end

  test "visiting the index" do
    visit debt_capitals_url
    assert_selector "h1", text: "Debt Capitals"
  end

  test "creating a Debt capital" do
    visit debt_capitals_url
    click_on "New Debt Capital"

    fill_in "Amount", with: @debt_capital.amount
    fill_in "Category", with: @debt_capital.category_id
    fill_in "Date", with: @debt_capital.date
    fill_in "Note", with: @debt_capital.note
    click_on "Create Debt capital"

    assert_text "Debt capital was successfully created"
    click_on "Back"
  end

  test "updating a Debt capital" do
    visit debt_capitals_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @debt_capital.amount
    fill_in "Category", with: @debt_capital.category_id
    fill_in "Date", with: @debt_capital.date
    fill_in "Note", with: @debt_capital.note
    click_on "Update Debt capital"

    assert_text "Debt capital was successfully updated"
    click_on "Back"
  end

  test "destroying a Debt capital" do
    visit debt_capitals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Debt capital was successfully destroyed"
  end
end
