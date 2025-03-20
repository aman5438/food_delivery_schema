class CreateOrderDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :order_deliveries do |t|
      t.references :order, null: false, foreign_key: { to_table: :orders, on_delete: :cascade }
      t.references :partner, null: false, foreign_key: { to_table: :delivery_partners, on_delete: :cascade }
      t.datetime :assigned_at
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
