require "application_system_test_case"

class PurchaseEntriesTest < ApplicationSystemTestCase
  setup do
    @purchase_entry = purchase_entries(:one)
  end

  test "visiting the index" do
    visit purchase_entries_url
    assert_selector "h1", text: "Purchase Entries"
  end

  test "creating a Purchase entry" do
    visit purchase_entries_url
    click_on "New Purchase Entry"

    fill_in "Product name", with: @purchase_entry.product_name
    fill_in "Product qty", with: @purchase_entry.product_qty
    fill_in "Status", with: @purchase_entry.status
    click_on "Create Purchase entry"

    assert_text "Purchase entry was successfully created"
    click_on "Back"
  end

  test "updating a Purchase entry" do
    visit purchase_entries_url
    click_on "Edit", match: :first

    fill_in "Product name", with: @purchase_entry.product_name
    fill_in "Product qty", with: @purchase_entry.product_qty
    fill_in "Status", with: @purchase_entry.status
    click_on "Update Purchase entry"

    assert_text "Purchase entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase entry" do
    visit purchase_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase entry was successfully destroyed"
  end
end
