require "application_system_test_case"

class BusinessTypesTest < ApplicationSystemTestCase
  setup do
    @business_type = business_types(:one)
  end

  test "visiting the index" do
    visit business_types_url
    assert_selector "h1", text: "Business Types"
  end

  test "creating a Business type" do
    visit business_types_url
    click_on "New Business Type"

    fill_in "Category", with: @business_type.category_id
    fill_in "Name", with: @business_type.name
    fill_in "Purchase price", with: @business_type.purchase_price
    fill_in "Quantity", with: @business_type.quantity
    fill_in "Sale price", with: @business_type.sale_price
    click_on "Create Business type"

    assert_text "Business type was successfully created"
    click_on "Back"
  end

  test "updating a Business type" do
    visit business_types_url
    click_on "Edit", match: :first

    fill_in "Category", with: @business_type.category_id
    fill_in "Name", with: @business_type.name
    fill_in "Purchase price", with: @business_type.purchase_price
    fill_in "Quantity", with: @business_type.quantity
    fill_in "Sale price", with: @business_type.sale_price
    click_on "Update Business type"

    assert_text "Business type was successfully updated"
    click_on "Back"
  end

  test "destroying a Business type" do
    visit business_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Business type was successfully destroyed"
  end
end
