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

ActiveRecord::Schema.define(version: 20170718222949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "conversations", id: :bigserial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
  end

  create_table "messages", id: :bigserial, force: :cascade do |t|
    t.text     "body"
    t.bigint   "conversation_id"
    t.bigint   "user_id"
    t.boolean  "read",               default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "notifications", id: :bigserial, force: :cascade do |t|
    t.bigint   "user_id"
    t.integer  "recipient_id"
    t.string   "action"
    t.string   "notifiable_type"
    t.integer  "notifiable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
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

  create_table "project_invites", id: :bigserial, force: :cascade do |t|
    t.string   "share_token"
    t.string   "email",       null: false
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
  end

  create_table "projects", id: :bigserial, force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "description"
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", null: false
    t.string   "shopify_token",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true, using: :btree
  end

  create_table "steps", id: :bigserial, force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.integer  "hours"
    t.bigint   "project_id"
    t.string   "status"
    t.string   "description"
    t.index ["project_id"], name: "index_steps_on_project_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "product_type_id"
    t.string   "title"
    t.string   "handle"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["product_type_id"], name: "index_tags_on_product_type_id", using: :btree
  end

  create_table "user_projects", id: :bigserial, force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_type"
  end

  create_table "users", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "notifications", "users"
  add_foreign_key "product_tags", "products"
  add_foreign_key "product_tags", "tags"
  add_foreign_key "product_types", "categories"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "product_types"
  add_foreign_key "steps", "projects"
  add_foreign_key "tags", "product_types"
end
