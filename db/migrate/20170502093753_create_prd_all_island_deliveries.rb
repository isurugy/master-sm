class CreatePrdAllIslandDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :prd_all_island_deliveries do |t|

      t.integer :delivery_period
      t.money :delivery_rate

      t.references :prd_item, foreign_key: true

      t.timestamps
    end
  end
end
