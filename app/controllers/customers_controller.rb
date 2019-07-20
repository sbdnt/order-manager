class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.paginate page: params[:page], per_page: 10
    @sub_title = " - Quản Lý Khách Hàng"
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @sub_title = " - Chi Tiết Khách Hàng"
  end

  # GET /customers/new
  def new
    @sub_title = " - Tạo Khách Hàng Mới"
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @sub_title = " - Sửa Thông Tin Khách Hàng"
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Đã Tạo Khách Hàng Mới.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Đã Tạo Khách Hàng Mới.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Đã Xóa Khách Hàng.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:cust_name, :cust_phone, :cust_address, :cust_desc, :cust_nation)
    end
end
