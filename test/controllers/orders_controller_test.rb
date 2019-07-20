require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { clean_step: @order.clean_step, completed_date: @order.completed_date, customer_info: @order.customer_info, desc: @order.desc, end_date: @order.end_date, filter_step: @order.filter_step, input_step: @order.input_step, is_deleted: @order.is_deleted, name: @order.name, orderID: @order.orderID, order_type: @order.order_type, package_step: @order.package_step, start_date: @order.start_date, status: @order.status, stock_info: @order.stock_info } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { clean_step: @order.clean_step, completed_date: @order.completed_date, customer_info: @order.customer_info, desc: @order.desc, end_date: @order.end_date, filter_step: @order.filter_step, input_step: @order.input_step, is_deleted: @order.is_deleted, name: @order.name, orderID: @order.orderID, order_type: @order.order_type, package_step: @order.package_step, start_date: @order.start_date, status: @order.status, stock_info: @order.stock_info } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
