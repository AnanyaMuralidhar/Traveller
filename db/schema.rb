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

ActiveRecord::Schema[7.0].define(version: 2023_05_22_191529) do
  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "companyname"
    t.string "hqlocation"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "rate"
    t.text "descr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_feedbacks_on_company_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "slots", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "bookingtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "trippackage_id"
    t.index ["trippackage_id"], name: "index_slots_on_trippackage_id"
    t.index ["user_id"], name: "index_slots_on_user_id"
  end

  create_table "trippackages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "package_name"
    t.string "destination"
    t.datetime "departure"
    t.datetime "arrival"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "budget"
    t.string "travelfrom"
    t.integer "noofbookings"
    t.string "packcountry"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_trippackages_on_company_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "homelocation"
    t.string "phoneno"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "feedbacks", "companies"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "slots", "trippackages"
  add_foreign_key "slots", "users"
  add_foreign_key "trippackages", "companies"
end
