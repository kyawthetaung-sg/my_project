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

ActiveRecord::Schema.define(version: 2020_07_29_064907) do

  create_table "business_types", force: :cascade do |t|
    t.string "name"
    t.float "purchase_price"
    t.float "sale_price"
    t.integer "quantity"
    t.integer "category_id", null: false
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_business_types_on_category_id"
    t.index ["created_by"], name: "index_business_types_on_created_by"
    t.index ["deleted_at"], name: "index_business_types_on_deleted_at"
    t.index ["deleted_by"], name: "index_business_types_on_deleted_by"
    t.index ["updated_by"], name: "index_business_types_on_updated_by"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by"], name: "index_categories_on_created_by"
    t.index ["deleted_at"], name: "index_categories_on_deleted_at"
    t.index ["deleted_by"], name: "index_categories_on_deleted_by"
    t.index ["updated_by"], name: "index_categories_on_updated_by"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.text "address"
    t.text "note"
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by"], name: "index_customers_on_created_by"
    t.index ["deleted_at"], name: "index_customers_on_deleted_at"
    t.index ["deleted_by"], name: "index_customers_on_deleted_by"
    t.index ["updated_by"], name: "index_customers_on_updated_by"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by"], name: "index_roles_on_created_by"
    t.index ["deleted_at"], name: "index_roles_on_deleted_at"
    t.index ["deleted_by"], name: "index_roles_on_deleted_by"
    t.index ["updated_by"], name: "index_roles_on_updated_by"
  end

  create_table "sale_list_business_types", id: false, force: :cascade do |t|
    t.integer "sale_list_id", null: false
    t.integer "business_type_id", null: false
    t.float "sale_price"
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_type_id"], name: "index_sale_list_business_types_on_business_type_id"
    t.index ["created_by"], name: "index_sale_list_business_types_on_created_by"
    t.index ["deleted_at"], name: "index_sale_list_business_types_on_deleted_at"
    t.index ["deleted_by"], name: "index_sale_list_business_types_on_deleted_by"
    t.index ["sale_list_id"], name: "index_sale_list_business_types_on_sale_list_id"
    t.index ["updated_by"], name: "index_sale_list_business_types_on_updated_by"
  end

  create_table "sale_lists", force: :cascade do |t|
    t.datetime "date"
    t.integer "customer_id", null: false
    t.float "first_payment", default: 0.0, null: false
    t.string "image"
    t.text "note"
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by"], name: "index_sale_lists_on_created_by"
    t.index ["customer_id"], name: "index_sale_lists_on_customer_id"
    t.index ["deleted_at"], name: "index_sale_lists_on_deleted_at"
    t.index ["deleted_by"], name: "index_sale_lists_on_deleted_by"
    t.index ["updated_by"], name: "index_sale_lists_on_updated_by"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by"], name: "index_themes_on_created_by"
    t.index ["deleted_at"], name: "index_themes_on_deleted_at"
    t.index ["deleted_by"], name: "index_themes_on_deleted_by"
    t.index ["updated_by"], name: "index_themes_on_updated_by"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "theme_id"
    t.integer "language", default: 1, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["theme_id"], name: "index_users_on_theme_id"
  end

  add_foreign_key "business_types", "categories"
  add_foreign_key "sale_list_business_types", "business_types"
  add_foreign_key "sale_list_business_types", "sale_lists"
  add_foreign_key "sale_lists", "customers"
  add_foreign_key "users", "themes"
end
