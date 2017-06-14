class CreatePrdOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_orders do |t|

      t.integer :customer_id
      t.integer :item_id
      t.money :item_price

      t.timestamps
    end
  end
end
