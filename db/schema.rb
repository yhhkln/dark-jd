# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170919134655) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "product_id"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dcart_items", force: :cascade do |t|
    t.integer  "dcart_id"
    t.integer  "dproduct_id"
    t.integer  "quantity",    default: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "dcarts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dcategories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dorders", force: :cascade do |t|
    t.integer  "total",            default: 0
    t.integer  "user_id"
    t.string   "billing_name"
    t.string   "billing_address"
    t.string   "shipping_name"
    t.string   "shipping_address"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "token"
    t.boolean  "is_paid",          default: false
    t.string   "payment_method"
    t.string   "aasm_state",       default: "dorder_placed"
    t.index ["aasm_state"], name: "index_dorders_on_aasm_state"
  end

  create_table "dproduct_lists", force: :cascade do |t|
    t.integer  "dorder_id"
    t.string   "dproduct_name"
    t.integer  "dproduct_price"
    t.integer  "quantity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "dproducts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image"
    t.integer  "dcategory_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "wage_upper_bound"
    t.integer  "wage_lower_bound"
    t.string   "contact_email"
    t.boolean  "is_hidden",        default: true
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "total",            default: 0
    t.integer  "user_id"
    t.string   "billing_name"
    t.string   "billing_address"
    t.string   "shipping_name"
    t.string   "shipping_address"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "token"
    t.boolean  "is_paid",          default: false
    t.string   "payment_method"
    t.string   "aasm_state",       default: "order_placed"
    t.string   "province"
    t.string   "city"
    t.string   "district"
    t.string   "address"
    t.date     "date"
    t.index ["aasm_state"], name: "index_orders_on_aasm_state"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_lists", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "product_name"
    t.integer  "product_price"
    t.integer  "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.integer  "quantity"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image"
    t.integer  "salt",        default: 5
    t.integer  "sugar",       default: 5
    t.integer  "papper",      default: 5
    t.integer  "sauces",      default: 10
    t.integer  "vinegar",     default: 10
    t.integer  "oil",         default: 10
    t.integer  "position"
    t.integer  "category_id"
    t.string   "friendly_id"
    t.index ["friendly_id"], name: "index_products_on_friendly_id", unique: true
  end

  create_table "resumes", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "attachment"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.string   "name"
    t.boolean  "is_dadmin",              default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
