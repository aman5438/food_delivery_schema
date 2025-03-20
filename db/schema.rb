# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_03_20_112625) do
  create_table "delivery_partners", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.string "phone", limit: 20, null: false
    t.string "vechile_number", limit: 20, null: false
    t.text "location", null: false
    t.string "status", default: "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.text "description", null: false
    t.bigint "resturant_id", null: false
    t.decimal "price", precision: 10, scale: 2
    t.boolean "is_available", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resturant_id"], name: "index_menu_items_on_resturant_id"
  end

  create_table "order_deliveries", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "partner_id", null: false
    t.datetime "assigned_at"
    t.datetime "delivered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_deliveries_on_order_id"
    t.index ["partner_id"], name: "index_order_deliveries_on_partner_id"
  end

  create_table "order_items", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "menu_item_id", null: false
    t.integer "quantity", null: false
    t.decimal "price_at_time", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_order_items_on_menu_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "resturant_id", null: false
    t.string "status", default: "pending"
    t.decimal "total_price", precision: 10, scale: 2, null: false
    t.datetime "placed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resturant_id"], name: "index_orders_on_resturant_id"
    t.index ["users_id"], name: "index_orders_on_users_id"
  end

  create_table "owners", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.string "email", limit: 30, null: false
    t.string "phone", limit: 30, null: false
    t.text "password_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["phone"], name: "index_owners_on_phone", unique: true
  end

  create_table "payments", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "user_id", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.string "payment_method", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "resturants", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.text "localtion", null: false
    t.decimal "rating", precision: 2, scale: 1, default: "0.0"
    t.string "cuisine_type", limit: 100
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_resturants_on_owner_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.string "email", limit: 20, null: false
    t.string "phone", limit: 20, null: false
    t.text "address", null: false
    t.text "password_hash", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

  add_foreign_key "menu_items", "resturants", on_delete: :cascade
  add_foreign_key "order_deliveries", "delivery_partners", column: "partner_id", on_delete: :cascade
  add_foreign_key "order_deliveries", "orders", on_delete: :cascade
  add_foreign_key "order_items", "menu_items", on_delete: :cascade
  add_foreign_key "order_items", "orders", on_delete: :cascade
  add_foreign_key "orders", "resturants", on_delete: :cascade
  add_foreign_key "orders", "users", column: "users_id", on_delete: :cascade
  add_foreign_key "payments", "orders", on_delete: :cascade
  add_foreign_key "payments", "users", on_delete: :cascade
  add_foreign_key "resturants", "owners", on_delete: :cascade
end
