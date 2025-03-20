class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: { to_table: :orders, on_delete: :cascade }
      t.references :user, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :payment_method, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
