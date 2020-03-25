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

ActiveRecord::Schema.define(version: 20200325203953) do

  create_table "applications", force: :cascade do |t|
    t.integer "position_id"
    t.integer "candidate_id"
    t.boolean "submitted",    default: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.float  "gpa"
    t.string "education_level"
    t.string "native_language"
    t.string "second_language"
  end

  create_table "positions", force: :cascade do |t|
    t.string   "api_id"
    t.string   "position_type"
    t.string   "url"
    t.datetime "created_at"
    t.string   "company"
    t.string   "company_url"
    t.string   "location"
    t.string   "title"
    t.string   "description"
    t.string   "how_to_apply"
    t.string   "company_logo"
  end

end
