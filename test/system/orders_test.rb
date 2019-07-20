require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Clean step", with: @order.clean_step
    fill_in "Completed date", with: @order.completed_date
    fill_in "Customer info", with: @order.customer_info
    fill_in "Desc", with: @order.desc
    fill_in "End date", with: @order.end_date
    fill_in "Filter step", with: @order.filter_step
    fill_in "Input step", with: @order.input_step
    fill_in "Is deleted", with: @order.is_deleted
    fill_in "Name", with: @order.name
    fill_in "Orderid", with: @order.orderID
    fill_in "Order type", with: @order.order_type
    fill_in "Package step", with: @order.package_step
    fill_in "Start date", with: @order.start_date
    fill_in "Status", with: @order.status
    fill_in "Stock info", with: @order.stock_info
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Clean step", with: @order.clean_step
    fill_in "Completed date", with: @order.completed_date
    fill_in "Customer info", with: @order.customer_info
    fill_in "Desc", with: @order.desc
    fill_in "End date", with: @order.end_date
    fill_in "Filter step", with: @order.filter_step
    fill_in "Input step", with: @order.input_step
    fill_in "Is deleted", with: @order.is_deleted
    fill_in "Name", with: @order.name
    fill_in "Orderid", with: @order.orderID
    fill_in "Order type", with: @order.order_type
    fill_in "Package step", with: @order.package_step
    fill_in "Start date", with: @order.start_date
    fill_in "Status", with: @order.status
    fill_in "Stock info", with: @order.stock_info
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
