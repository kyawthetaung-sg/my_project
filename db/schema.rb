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

ActiveRecord::Schema.define(version: 2020_08_11_101308) do

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

  create_table "expense_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by"], name: "index_expense_categories_on_created_by"
    t.index ["deleted_at"], name: "index_expense_categories_on_deleted_at"
    t.index ["deleted_by"], name: "index_expense_categories_on_deleted_by"
    t.index ["updated_by"], name: "index_expense_categories_on_updated_by"
  end

  create_table "expenses", force: :cascade do |t|
    t.datetime "date"
    t.decimal "amount"
    t.integer "expense_category_id", null: false
    t.integer "payment_mode_id", null: false
    t.text "note"
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by"], name: "index_expenses_on_created_by"
    t.index ["deleted_at"], name: "index_expenses_on_deleted_at"
    t.index ["deleted_by"], name: "index_expenses_on_deleted_by"
    t.index ["expense_category_id"], name: "index_expenses_on_expense_category_id"
    t.index ["payment_mode_id"], name: "index_expenses_on_payment_mode_id"
    t.index ["updated_by"], name: "index_expenses_on_updated_by"
  end

  create_table "incomes", force: :cascade do |t|
    t.datetime "date"
    t.decimal "amount"
    t.integer "expense_category_id", null: false
    t.integer "payment_mode_id", null: false
    t.text "note"
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by"], name: "index_incomes_on_created_by"
    t.index ["deleted_at"], name: "index_incomes_on_deleted_at"
    t.index ["deleted_by"], name: "index_incomes_on_deleted_by"
    t.index ["expense_category_id"], name: "index_incomes_on_expense_category_id"
    t.index ["payment_mode_id"], name: "index_incomes_on_payment_mode_id"
    t.index ["updated_by"], name: "index_incomes_on_updated_by"
  end

  create_table "payment_modes", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by"], name: "index_payment_modes_on_created_by"
    t.index ["deleted_at"], name: "index_payment_modes_on_deleted_at"
    t.index ["deleted_by"], name: "index_payment_modes_on_deleted_by"
    t.index ["updated_by"], name: "index_payment_modes_on_updated_by"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "role_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_permissions_on_role_id"
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
    t.string "user_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "deleted_at"
    t.integer "created_by", limit: 8
    t.integer "updated_by", limit: 8
    t.integer "deleted_by", limit: 8
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "theme_id", null: false
    t.integer "language", default: 1, null: false
    t.integer "role_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["created_by"], name: "index_users_on_created_by"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["deleted_by"], name: "index_users_on_deleted_by"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["theme_id"], name: "index_users_on_theme_id"
    t.index ["updated_by"], name: "index_users_on_updated_by"
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "business_types", "categories"
  add_foreign_key "expenses", "expense_categories"
  add_foreign_key "expenses", "payment_modes"
  add_foreign_key "incomes", "expense_categories"
  add_foreign_key "incomes", "payment_modes"
  add_foreign_key "permissions", "roles"
  add_foreign_key "sale_list_business_types", "business_types"
  add_foreign_key "sale_list_business_types", "sale_lists"
  add_foreign_key "sale_lists", "customers"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "themes"
end
