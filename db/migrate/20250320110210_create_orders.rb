class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :users, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
      t.references :resturant, null: false, foreign_key: { to_table: :resturants, on_delete: :cascade }
      t.column :status, :string, default: "pending"
      t.decimal :total_price, precision:10, scale: 2, null: false
      t.datetime :placed_at

      t.timestamps
    end
  end
end
