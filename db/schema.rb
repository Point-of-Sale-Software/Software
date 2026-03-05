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

ActiveRecord::Schema[8.1].define(version: 2026_02_21_180818) do
  create_table "items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.decimal "net_price"
    t.datetime "updated_at", null: false
    t.decimal "vat_rate"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount", null: false
    t.datetime "created_at", null: false
    t.string "method", null: false
    t.integer "sale_id", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id"], name: "index_payments_on_sale_id"
  end

  create_table "sale_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "gross_price", null: false
    t.integer "item_id", null: false
    t.decimal "net_price", null: false
    t.integer "quantity", null: false
    t.integer "sale_id", null: false
    t.datetime "updated_at", null: false
    t.decimal "vat_price", null: false
    t.decimal "vat_rate", null: false
    t.index ["item_id"], name: "index_sale_items_on_item_id"
    t.index ["sale_id"], name: "index_sale_items_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "started_at", null: false
    t.integer "till_session_id", null: false
    t.datetime "updated_at", null: false
    t.index ["till_session_id"], name: "index_sales_on_till_session_id"
  end

  create_table "till_sessions", force: :cascade do |t|
    t.datetime "closed_at"
    t.decimal "closing_float"
    t.datetime "created_at", null: false
    t.datetime "opened_at", null: false
    t.decimal "opening_float", null: false
    t.integer "till_id", null: false
    t.datetime "updated_at", null: false
    t.index ["till_id"], name: "index_till_sessions_on_till_id"
    t.index ["till_id"], name: "unique_active_till_session_per_till", unique: true, where: "closed_at IS NULL"
  end

  create_table "tills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "payments", "sales"
  add_foreign_key "sale_items", "items"
  add_foreign_key "sale_items", "sales"
  add_foreign_key "sales", "till_sessions"
  add_foreign_key "till_sessions", "tills"
  add_foreign_key "till_sessions", "tills", on_delete: :restrict
end
