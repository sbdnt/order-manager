class OrdersController < ApplicationController
  include ApplicationHelper
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  
  # GET /orders
  # GET /orders.json
  def index
    @search = Order.ransack params[:q]
    @orders = @search.result.paginate page: params[:page], per_page: 10
    @sub_title = " - Quản lý đơn hàng"
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
      @sub_title = " - Chi tiết đơn hàng"
  end

  # GET /orders/new
  def new
    @order = Order.new(
      orderID: generate_order_id
    )
    @sub_title = " - Thực hiện đơn hàng"
  end

  # GET /orders/1/edit
  def edit
    @sub_title = " - Chỉnh sửa đơn hàng"
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        ### create event
        (@order.input_from..@order.input_to).each do |event_date|
          Event.create(
            order_id: @order.id,
            step_name: 'input',
            event_date: event_date
          )
        end
        (@order.clean_from..@order.clean_to).each do |event_date|
          Event.create(
            order_id: @order.id,
            step_name: 'clean',
            event_date: event_date
          )
        end
        (@order.filter_from..@order.filter_to).each do |event_date|
          Event.create(
            order_id: @order.id,
            step_name: 'filter',
            event_date: event_date
          )
        end
        (@order.package_from..@order.package_to).each do |event_date|
          Event.create(
            order_id: @order.id,
            step_name: 'package',
            event_date: event_date
          )
        end
        
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:orderID, :name, :order_type, :customer_info, :stock_info, :status, :desc, :start_date, :input_from, :input_to, :clean_from, :clean_to, :filter_from, :filter_to,  :package_from, :package_to, :completed_date, :end_date, :is_deleted)
    end
end
