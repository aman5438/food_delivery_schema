class CreateMenuItems < ActiveRecord::Migration[7.1]
  def change
    create_table :menu_items do |t|
      t.string :name, null: false, limit: 20
      t.text :description, null: false
      t.references :resturant, null: false, foreign_key: { to_table: :resturants, on_delete: :cascade }
      t.decimal :price, precision: 10, scale: 2
      t.boolean :is_available, default: true
      t.timestamps
    end
  end
end
