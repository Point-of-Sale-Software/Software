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

ActiveRecord::Schema[8.1].define(version: 2026_02_20_233527) do
  create_table "items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.decimal "net_price"
    t.datetime "updated_at", null: false
    t.decimal "vat_rate"
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

  add_foreign_key "till_sessions", "tills"
end
