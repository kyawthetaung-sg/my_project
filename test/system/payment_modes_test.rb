require "application_system_test_case"

class PaymentModesTest < ApplicationSystemTestCase
  setup do
    @payment_mode = payment_modes(:one)
  end

  test "visiting the index" do
    visit payment_modes_url
    assert_selector "h1", text: "Payment Modes"
  end

  test "creating a Payment mode" do
    visit payment_modes_url
    click_on "New Payment Mode"

    fill_in "Name", with: @payment_mode.name
    click_on "Create Payment mode"

    assert_text "Payment mode was successfully created"
    click_on "Back"
  end

  test "updating a Payment mode" do
    visit payment_modes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @payment_mode.name
    click_on "Update Payment mode"

    assert_text "Payment mode was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment mode" do
    visit payment_modes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment mode was successfully destroyed"
  end
end
