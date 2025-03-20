class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: { to_table: :orders, on_delete: :cascade }
      t.references :menu_item, null: false, foreign_key: { to_table: :menu_items, on_delete: :cascade }
      t.integer :quantity, null: false
      t.decimal :price_at_time, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
