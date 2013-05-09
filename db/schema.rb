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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130509151042) do

  create_table "corporations", :force => true do |t|
    t.string   "faction"
    t.string   "slogan"
    t.string   "identity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "runner_user_id"
    t.integer  "corporation_user_id"
    t.integer  "runner_id"
    t.integer  "corporation_id"
    t.integer  "runner_score"
    t.integer  "corporation_score"
    t.date     "date"
    t.text     "comment"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.text     "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "runners", :force => true do |t|
    t.string   "faction"
    t.string   "identity"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "userid"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "league_id"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",           :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
