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

ActiveRecord::Schema.define(version: 20140908182713) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",            limit: 255, null: false
    t.string   "crypted_password", limit: 255, null: false
    t.string   "salt",             limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "full_name",        limit: 255
    t.text     "description",      limit: 65535
    t.boolean  "investor"
    t.boolean  "entrepreneur"
    t.string   "website",          limit: 255
    t.string   "profile_picture",  limit: 255
    t.date     "birth_date"
    t.string   "location",         limit: 255
    t.string   "twitter_handle",   limit: 255
    t.boolean  "published",                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "linkedin_profile", limit: 255
    t.integer  "position",         limit: 4
    t.string   "company",          limit: 255
    t.string   "email",            limit: 255
  end

end
