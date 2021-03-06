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

ActiveRecord::Schema.define(version: 20180225175638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "team_followers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_team_followers_on_team_id"
    t.index ["user_id"], name: "index_team_followers_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_code"
    t.index ["team_code"], name: "index_teams_on_team_code"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "team_role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "team_followers", "teams"
  add_foreign_key "team_followers", "users"
end
