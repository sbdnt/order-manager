class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :cust_name
      t.string :cust_phone
      t.string :cust_address
      t.string :cust_desc
      t.string :cust_nation

      t.timestamps
    end
  end
end
