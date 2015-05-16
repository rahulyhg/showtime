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

ActiveRecord::Schema.define(version: 20150516160450) do

  create_table "content_purchase_options", force: :cascade do |t|
    t.integer  "content_id"
    t.string   "content_type"
    t.integer  "purchase_option_id"
    t.boolean  "active",                                     default: false
    t.decimal  "price",              precision: 8, scale: 2
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "content_purchase_options", ["content_type", "content_id"], name: "index_content_purchase_options_on_content_type_and_content_id"
  add_index "content_purchase_options", ["purchase_option_id"], name: "index_content_purchase_options_on_purchase_option_id"

  create_table "contents", force: :cascade do |t|
    t.string   "title"
    t.text     "plot"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "contents", ["slug"], name: "index_contents_on_slug", unique: true

  create_table "episodes", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "num"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "plot",       default: ""
  end

  add_index "episodes", ["season_id"], name: "index_episodes_on_season_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "purchase_options", force: :cascade do |t|
    t.decimal  "price",      precision: 8, scale: 2
    t.string   "quality"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "content_purchase_option_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "purchases", ["content_purchase_option_id"], name: "index_purchases_on_content_purchase_option_id"
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
