class CreatePrdGreaterColomboDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_greater_colombo_deliveries do |t|

      t.integer :delivery_period
      t.money :delivery_rate

      t.references :prd_item, foreign_key: true

      t.timestamps
    end
  end
end
