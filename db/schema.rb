# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150408204316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.integer "user_id"
    t.string  "slug"
    t.string  "status",      default: "pending"
  end

  add_index "businesses", ["user_id"], name: "index_businesses_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "item_categories", force: :cascade do |t|
    t.integer "item_id"
    t.integer "category_id"
  end

  create_table "item_statuses", force: :cascade do |t|
    t.string "state"
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "item_status_id"
    t.integer  "price"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "order_id"
    t.integer "quantity"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status_id",  default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "state"
  end

  create_table "users", force: :cascade do |t|
    t.string  "email"
    t.string  "full_name"
    t.string  "display_name"
    t.string  "username"
    t.string  "password_digest"
    t.integer "role",             default: 0
    t.string  "provider"
    t.string  "uid"
    t.string  "image",            default: "default_user_image.png"
    t.string  "location",         default: "Denver, CO"
    t.string  "shipping_address"
    t.string  "billing_address"
    t.string  "credit_card"
    t.string  "slug"
  end

  add_foreign_key "businesses", "users"
end
