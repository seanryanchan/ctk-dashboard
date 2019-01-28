require 'test_helper'

class PurchaseEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_entry = purchase_entries(:one)
  end

  test "should get index" do
    get purchase_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_entry_url
    assert_response :success
  end

  test "should create purchase_entry" do
    assert_difference('PurchaseEntry.count') do
      post purchase_entries_url, params: { purchase_entry: { product_name: @purchase_entry.product_name, product_qty: @purchase_entry.product_qty, status: @purchase_entry.status } }
    end

    assert_redirected_to purchase_entry_url(PurchaseEntry.last)
  end

  test "should show purchase_entry" do
    get purchase_entry_url(@purchase_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_entry_url(@purchase_entry)
    assert_response :success
  end

  test "should update purchase_entry" do
    patch purchase_entry_url(@purchase_entry), params: { purchase_entry: { product_name: @purchase_entry.product_name, product_qty: @purchase_entry.product_qty, status: @purchase_entry.status } }
    assert_redirected_to purchase_entry_url(@purchase_entry)
  end

  test "should destroy purchase_entry" do
    assert_difference('PurchaseEntry.count', -1) do
      delete purchase_entry_url(@purchase_entry)
    end

    assert_redirected_to purchase_entries_url
  end
end
