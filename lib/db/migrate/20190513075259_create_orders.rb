class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :orderID
      t.string :name
      t.string :order_type
      t.string :customer_info
      t.string :stock_info
      t.string :status
      t.text :desc
      t.date :start_date
      t.date :input_from
      t.date :input_to
      t.date :clean_from
      t.date :clean_to
      t.date :filter_from
      t.date :filter_to
      t.date :package_from
      t.date :package_to
      t.date :completed_date
      t.date :end_date
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
