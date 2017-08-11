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

ActiveRecord::Schema.define(version: 20170807225801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :bigserial, force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "activities", id: :bigserial, force: :cascade do |t|
    t.string   "description"
    t.string   "title"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "event_id"
    t.datetime "date"
    t.datetime "time"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "handle"
    t.string   "shopify_collection_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string   "shop_id"
    t.string   "title"
    t.string   "shopify_collection_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "events", id: :bigserial, force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "product_tags", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_tags_on_product_id", using: :btree
    t.index ["tag_id"], name: "index_product_tags_on_tag_id", using: :btree
  end

  create_table "product_types", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title"
    t.string   "handle"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_product_types_on_category_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "product_type_id"
    t.integer  "category_id"
    t.string   "shopify_product_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["product_type_id"], name: "index_products_on_product_type_id", using: :btree
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", null: false
    t.string   "shopify_token",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true, using: :btree
  end

  create_table "supplementals", id: :bigserial, force: :cascade do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "event_id"
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "product_type_id"
    t.string   "title"
    t.string   "handle"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["product_type_id"], name: "index_tags_on_product_type_id", using: :btree
  end

  create_table "teams", id: :bigserial, force: :cascade do |t|
    t.integer  "car_number"
    t.string   "competitor_type"
    t.string   "car_type"
    t.string   "driver_name"
    t.string   "co_driver_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "car_class"
  end

  create_table "users", id: :bigserial, force: :cascade do |t|
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
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "product_tags", "products"
  add_foreign_key "product_tags", "tags"
  add_foreign_key "product_types", "categories"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "product_types"
  add_foreign_key "tags", "product_types"
end
