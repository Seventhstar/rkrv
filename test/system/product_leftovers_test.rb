require "application_system_test_case"

class ProductLeftoversTest < ApplicationSystemTestCase
  setup do
    @product_leftover = product_leftovers(:one)
  end

  test "visiting the index" do
    visit product_leftovers_url
    assert_selector "h1", text: "Product Leftovers"
  end

  test "creating a Product leftover" do
    visit product_leftovers_url
    click_on "New Product Leftover"

    fill_in "Count", with: @product_leftover.count
    fill_in "Date", with: @product_leftover.date
    fill_in "Product", with: @product_leftover.product
    fill_in "Store", with: @product_leftover.store_id
    click_on "Create Product leftover"

    assert_text "Product leftover was successfully created"
    click_on "Back"
  end

  test "updating a Product leftover" do
    visit product_leftovers_url
    click_on "Edit", match: :first

    fill_in "Count", with: @product_leftover.count
    fill_in "Date", with: @product_leftover.date
    fill_in "Product", with: @product_leftover.product
    fill_in "Store", with: @product_leftover.store_id
    click_on "Update Product leftover"

    assert_text "Product leftover was successfully updated"
    click_on "Back"
  end

  test "destroying a Product leftover" do
    visit product_leftovers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product leftover was successfully destroyed"
  end
end
