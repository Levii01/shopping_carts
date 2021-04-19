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

ActiveRecord::Schema.define(version: 20_210_419_204_519) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basket_products", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "basket_id", null: false
    t.decimal "price", precision: 13, scale: 2, default: "0.0", null: false
    t.decimal "promotional_price", precision: 13, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["basket_id"], name: "index_basket_products_on_basket_id"
    t.index ["product_id"], name: "index_basket_products_on_product_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.jsonb "promotional_rules"
    t.decimal "regular_price", precision: 13, scale: 2, default: "0.0", null: false
    t.decimal "final_price", precision: 13, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "products", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.decimal "price", precision: 13, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_products_on_code"
  end

  create_table "promotional_items", force: :cascade do |t|
    t.string "code"
    t.bigint "product_id", null: false
    t.decimal "price", precision: 13, scale: 2, default: "0.0", null: false
    t.integer "activation_amount"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_promotional_items_on_product_id"
  end

  create_table "promotional_orders", force: :cascade do |t|
    t.string "code"
    t.integer "percentage"
    t.decimal "activation_price", precision: 13, scale: 2, default: "0.0", null: false
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "basket_products", "baskets"
  add_foreign_key "basket_products", "products"
  add_foreign_key "promotional_items", "products"
end
