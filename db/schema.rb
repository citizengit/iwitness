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

ActiveRecord::Schema.define(version: 20140325023453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_posts", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "image"
    t.integer  "rating_up"
    t.integer  "rating_down"
    t.integer  "user_id"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postvotes_uservotes", id: false, force: true do |t|
    t.integer "post_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.text     "email"
    t.text     "image"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

end
