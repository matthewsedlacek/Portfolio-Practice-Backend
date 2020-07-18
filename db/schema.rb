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

ActiveRecord::Schema.define(version: 2020_07_18_064538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.string "logo"
    t.string "sector"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stock_prices", force: :cascade do |t|
    t.integer "company_id"
    t.string "current_price"
    t.string "dollar_change"
    t.string "percent_change"
    t.string "as_of_time"
    t.string "daily_high"
    t.string "daily_low"
    t.string "fifty_two_week_high"
    t.string "fifty_two_week_low"
    t.boolean "transacted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "stock_price_id"
    t.integer "portfolio_id"
    t.string "buy_sell"
    t.integer "quantity"
    t.string "updated_at"
    t.string "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
