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

ActiveRecord::Schema.define(version: 2020_04_13_144615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts_links", force: :cascade do |t|
    t.integer "user_id"
    t.integer "safe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admin_users_on_username", unique: true
  end

  create_table "attachments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "owner_id"
    t.string "owner_type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_attachments_on_owner_id"
  end

  create_table "conference_record_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conference_records", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "folder_id"
    t.bigint "user_id"
    t.bigint "department_id"
    t.boolean "admin"
    t.date "date_create"
    t.date "date_update"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "conference_record_type_id"
    t.index ["conference_record_type_id"], name: "index_conference_records_on_conference_record_type_id"
    t.index ["department_id"], name: "index_conference_records_on_department_id"
    t.index ["user_id"], name: "index_conference_records_on_user_id"
  end

  create_table "conferences", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "code1c"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organisation_id"
  end

  create_table "expense_salary_rows", force: :cascade do |t|
    t.bigint "expense_id"
    t.bigint "staff_id"
    t.integer "amount"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_expense_salary_rows_on_expense_id"
    t.index ["staff_id"], name: "index_expense_salary_rows_on_staff_id"
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code1c"
  end

  create_table "expenses", force: :cascade do |t|
    t.date "date"
    t.integer "amount"
    t.bigint "safe_id"
    t.bigint "expense_type_id"
    t.bigint "department_id"
    t.string "comment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organisation_id"
    t.index ["department_id"], name: "index_expenses_on_department_id"
    t.index ["expense_type_id"], name: "index_expenses_on_expense_type_id"
    t.index ["safe_id"], name: "index_expenses_on_safe_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "leftovers", force: :cascade do |t|
    t.integer "safe_id"
    t.integer "organisation_id"
    t.bigint "calculated"
    t.bigint "by_hand"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "forced"
  end

  create_table "money_request_rows", force: :cascade do |t|
    t.date "date"
    t.bigint "department_id"
    t.boolean "cash"
    t.string "purpose"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_money_request_rows_on_department_id"
  end

  create_table "money_requests", force: :cascade do |t|
    t.date "date_start"
    t.date "date_end"
    t.bigint "user_id"
    t.bigint "department_id"
    t.integer "amount_cash"
    t.integer "amount_bank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_money_requests_on_department_id"
    t.index ["user_id"], name: "index_money_requests_on_user_id"
  end

  create_table "money_transfer_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dds_code_from_1c"
    t.string "dds_code_to_1c"
  end

  create_table "money_transfers", force: :cascade do |t|
    t.date "doc_date"
    t.integer "safe_from_id"
    t.integer "safe_to_id"
    t.integer "amount"
    t.string "comment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "money_transfer_type_id", default: 1
    t.integer "o_from_id"
    t.integer "o_to_id"
    t.index ["money_transfer_type_id"], name: "index_money_transfers_on_money_transfer_type_id"
    t.index ["user_id"], name: "index_money_transfers_on_user_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.string "code1c"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "actual", default: true
  end

  create_table "product_leftovers", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "store_id"
    t.date "date"
    t.decimal "count", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_leftovers_on_product_id"
    t.index ["store_id"], name: "index_product_leftovers_on_store_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "uom_id"
    t.string "code1c"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "safe_links", force: :cascade do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "safe_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salary_payments", force: :cascade do |t|
    t.date "date"
    t.bigint "department_id"
    t.bigint "user_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_salary_payments_on_department_id"
    t.index ["user_id"], name: "index_salary_payments_on_user_id"
  end

  create_table "saves", force: :cascade do |t|
    t.string "name"
    t.string "code1c"
    t.bigint "organisation_id"
    t.string "department_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "safe_type_id"
    t.boolean "actual", default: true
    t.integer "owner_id"
    t.index ["organisation_id"], name: "index_saves_on_organisation_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.bigint "department_id"
    t.date "in_date"
    t.date "out_date"
    t.date "birthday"
    t.date "medbook"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code1c"
    t.index ["department_id"], name: "index_staffs_on_department_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_rights", force: :cascade do |t|
    t.string "model"
    t.integer "user_id"
    t.integer "days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uoms", force: :cascade do |t|
    t.string "name"
    t.string "mobile_app_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "approved", default: false, null: false
    t.boolean "admin", default: false
    t.string "token"
    t.string "password_digest"
    t.string "remember_digest"
    t.bigint "safe_id"
    t.string "code1c"
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["safe_id"], name: "index_users_on_safe_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "conference_records", "conference_record_types"
  add_foreign_key "conference_records", "departments"
  add_foreign_key "conference_records", "users"
  add_foreign_key "expense_salary_rows", "expenses"
  add_foreign_key "expense_salary_rows", "staffs"
  add_foreign_key "expenses", "departments"
  add_foreign_key "expenses", "expense_types"
  add_foreign_key "expenses", "saves"
  add_foreign_key "expenses", "users"
  add_foreign_key "money_request_rows", "departments"
  add_foreign_key "money_requests", "departments"
  add_foreign_key "money_requests", "users"
  add_foreign_key "money_transfers", "money_transfer_types"
  add_foreign_key "money_transfers", "users"
  add_foreign_key "product_leftovers", "stores"
  add_foreign_key "salary_payments", "departments"
  add_foreign_key "salary_payments", "users"
  add_foreign_key "saves", "organisations"
  add_foreign_key "staffs", "departments"
  add_foreign_key "users", "saves"
end
