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

ActiveRecord::Schema.define(version: 20140819073531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree

  create_table "people", force: true do |t|
    t.string   "full_name"
    t.text     "description"
    t.boolean  "investor"
    t.boolean  "entrepreneur"
    t.string   "website"
    t.string   "profile_picture"
    t.date     "birth_date"
    t.string   "location"
    t.string   "twitter_handle"
    t.boolean  "published",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "linkedin_profile"
    t.integer  "position"
  end

end
