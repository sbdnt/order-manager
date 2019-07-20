class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :sto_name
      t.string :sto_address
      t.text :sto_desc
      t.string :sto_manager

      t.timestamps
    end
  end
end
