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

ActiveRecord::Schema.define(version: 20140927202626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: true do |t|
    t.string   "title"
    t.string   "youtube_embed_url"
    t.string   "primary_screenshot"
    t.string   "screenshot1"
    t.string   "screenshot2"
    t.string   "screenshot3"
    t.string   "screenshot4"
    t.string   "screenshot5"
    t.string   "platforms"
    t.text     "long_description"
    t.text     "short_description"
    t.text     "minimum_system_requirements"
    t.text     "setup_instructions"
    t.text     "version_and_notes"
    t.text     "known_bugs"
    t.string   "controllers"
    t.string   "modes"
    t.integer  "category_id"
    t.integer  "user_id"
    t.date     "released_at"
    t.string   "publisher"
    t.string   "support_email"
    t.string   "paypal_id"
    t.string   "donation_email"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "kickstarter_url"
    t.string   "youtube_url"
    t.string   "googleplus_url"
    t.string   "linkedin_url"
    t.text     "credits"
    t.text     "copyrights"
    t.text     "disclaimers"
    t.string   "rift_versions"
    t.string   "developer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "rating",                      default: 0.0
    t.string   "author"
    t.float    "price"
  end

  create_table "apps_genres", id: false, force: true do |t|
    t.integer  "app_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "text"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "submitter"
    t.string   "phone"
    t.text     "address"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
