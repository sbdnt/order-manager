class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date     :event_date
      t.integer  :order_id
      t.string   :step_name
      t.timestamps
    end
    add_index :events, [:event_date]
  end
end 
