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

ActiveRecord::Schema.define(version: 20150620172629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "folders", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "type",                limit: 255
    t.string   "slug",                limit: 255
    t.string   "name",                limit: 255
    t.string   "tags"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string   "source_file_name"
    t.string   "source_content_type"
    t.integer  "source_file_size"
    t.datetime "source_updated_at"
    t.integer  "folder_id"
  end

  add_index "items", ["folder_id"], name: "index_items_on_folder_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "stack_items", force: :cascade do |t|
    t.integer  "stack_id"
    t.integer  "item_id"
    t.integer  "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stack_items", ["item_id"], name: "index_stack_items_on_item_id", using: :btree
  add_index "stack_items", ["stack_id"], name: "index_stack_items_on_stack_id", using: :btree

end
