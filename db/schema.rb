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

ActiveRecord::Schema.define(version: 20170608100417) do

  create_table "descriptions", force: :cascade do |t|
    t.string   "word",       limit: 255
    t.string   "tagged",     limit: 255
    t.integer  "count",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "feed_entries", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "summary",      limit: 65535
    t.string   "url",          limit: 255
    t.datetime "published_at"
    t.string   "guid",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "reviews",      limit: 65535
  end

  create_table "libraries", force: :cascade do |t|
    t.string   "word",             limit: 255
    t.string   "tagged",           limit: 255
    t.integer  "count",            limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "feed_entry_id_id", limit: 4
    t.integer  "feed_entry_id",    limit: 4
  end

  add_index "libraries", ["feed_entry_id"], name: "index_libraries_on_feed_entry_id", using: :btree
  add_index "libraries", ["feed_entry_id_id"], name: "index_libraries_on_feed_entry_id_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "movie",         limit: 255
    t.string   "author",        limit: 255
    t.string   "body",          limit: 3000
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "feed_entry_id", limit: 4
    t.string   "guid",          limit: 255
  end

  add_index "reviews", ["feed_entry_id"], name: "index_reviews_on_feed_entry_id", using: :btree

  add_foreign_key "libraries", "feed_entries"
  add_foreign_key "reviews", "feed_entries"
end
