# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_22_182737) do

  create_table "foodtrucks", force: :cascade do |t|
    t.string "Name"
    t.string "Type"
    t.text "Address"
    t.text "Description"
    t.string "Owner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "menuitems", force: :cascade do |t|
    t.string "Name"
    t.text "Description"
    t.decimal "price"
    t.integer "foodtruck_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["foodtruck_id"], name: "index_menuitems_on_foodtruck_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "order_no", null: false
    t.integer "item_id", null: false
    t.string "item_name", default: "2", null: false
    t.decimal "item_price", precision: 6, scale: 2, null: false
    t.integer "quantity", default: 1, null: false
    t.string "img_url"
    t.boolean "is_del", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "idx_order_id"
    t.index ["order_no"], name: "idx_order_no"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_no", null: false
    t.string "truck_id", null: false
    t.string "user_id", null: false
    t.integer "order_status", default: 2, null: false
    t.decimal "order_subtotal", precision: 6, scale: 2, null: false
    t.boolean "is_del", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_no"], name: "unique_idx_order_no", unique: true
    t.index ["truck_id"], name: "idx_truck_id"
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.boolean "is_active", default: true, null: false
    t.boolean "is_owner", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "menuitems", "foodtrucks"
end
