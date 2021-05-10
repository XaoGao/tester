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

ActiveRecord::Schema.define(version: 2021_05_10_113651) do

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "lock", default: false, null: false
    t.integer "sort_level", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "users_count", default: 0, null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "number", default: "", null: false
    t.string "slug", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "lock", default: false, null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "lock", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sort_level", default: 0, null: false
    t.integer "users_count", default: 0, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "lock", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login", default: "", null: false
    t.string "password_digest"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "middle_name", default: "", null: false
    t.integer "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "failed_attempt", default: 0, null: false
    t.boolean "lock", default: false, null: false
    t.integer "position_id", null: false
    t.integer "department_id", null: false
    t.integer "phone_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["phone_id"], name: "index_users_on_phone_id"
    t.index ["position_id"], name: "index_users_on_position_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "users", "departments"
  add_foreign_key "users", "phones"
  add_foreign_key "users", "positions"
end
