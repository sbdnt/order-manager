json.extract! customer, :id, :cust_name, :cust_phone, :cust_address, :cust_desc, :cust_nation, :created_at, :updated_at
json.url customer_url(customer, format: :json)
