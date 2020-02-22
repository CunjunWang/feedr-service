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

ActiveRecord::Schema.define(version: 2020_02_19_225800) do

  create_table "foodtrucks", force: :cascade do |t|
    t.string "Name"
    t.string "Type"
    t.text "Address"
    t.text "Description"
    t.string "Owner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  add_foreign_key "menuitems", "foodtrucks"
end
