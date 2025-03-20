class CreateResturants < ActiveRecord::Migration[7.1]
  def change
    create_table :resturants do |t|
      t.string :name, null: false, limit: 30
      t.text :localtion, null: false
      t.decimal :rating, precision: 2, scale: 1, default: 0
      t.string :cuisine_type, limit: 100
      t.references :owner, null: false, foreign_key: { to_table: :owners, on_delete: :cascade }

      t.timestamps
    end
  end
end
