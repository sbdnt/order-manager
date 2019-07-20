json.extract! order, :id, :orderID, :name, :order_type, :customer_info, :stock_info, :status, :desc, :start_date, :input_step, :clean_step, :filter_step, :package_step, :completed_date, :end_date, :is_deleted, :created_at, :updated_at
json.url order_url(order, format: :json)
