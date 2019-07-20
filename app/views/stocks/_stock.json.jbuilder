json.extract! stock, :id, :sto_name, :sto_address, :sto_desc, :sto_manager, :created_at, :updated_at
json.url stock_url(stock, format: :json)
