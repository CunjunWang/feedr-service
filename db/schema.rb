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

ActiveRecord::Schema.define(version: 2020_03_27_194307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "foodtrucks", force: :cascade do |t|
    t.string "Name"
    t.string "Type"
    t.text "Address"
    t.text "Description"
    t.string "Owner"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_open", default: false
    t.decimal "latitude"
    t.decimal "longitude"
  end

  create_table "menuitems", force: :cascade do |t|
    t.string "Name"
    t.text "Description"
    t.decimal "price"
    t.bigint "foodtruck_id", null: false
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

  create_table "order_update_records", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "order_no", null: false
    t.integer "before_update_status_code", null: false
    t.string "before_update_status", null: false
    t.integer "after_update_status_code", null: false
    t.string "after_update_status", null: false
    t.integer "operator_id"
    t.string "operator_name"
    t.boolean "is_del", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "idx_record_order_id"
    t.index ["order_no"], name: "idx_record_order_no"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_no", null: false
    t.string "truck_id", null: false
    t.string "truck_name", default: "", null: false
    t.string "truck_img"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "menuitems", "foodtrucks"
end
