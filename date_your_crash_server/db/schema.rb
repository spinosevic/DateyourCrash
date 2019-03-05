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

ActiveRecord::Schema.define(version: 2019_03_05_104014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "celebrities", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "parameters", default: [], array: true
  end

  create_table "descriptions", force: :cascade do |t|
    t.string "desc_type"
    t.bigint "desc_id"
    t.integer "arched_eyebrows"
    t.integer "beard"
    t.integer "big_lips"
    t.integer "big_nose"
    t.integer "black_hair"
    t.integer "blond_hair"
    t.integer "bushy_eyebrows"
    t.integer "chubby"
    t.integer "heavy_makeup"
    t.integer "high_cheekbones"
    t.integer "mustache"
    t.integer "narrow_eyes"
    t.integer "pale_skin"
    t.integer "pointy_nose"
    t.integer "receding_hairline"
    t.integer "rosy_cheeks"
    t.integer "straight_hair"
    t.integer "wavy_hair"
    t.integer "white"
    t.integer "asian"
    t.integer "hispanic"
    t.integer "black"
    t.integer "indian"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["desc_type", "desc_id"], name: "index_descriptions_on_desc_type_and_desc_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "user_id"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_celebrities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "celebrity_id"
    t.integer "output"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "name"
    t.string "gender"
    t.string "interest"
    t.string "url"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "parameters", default: [], array: true
    t.index ["match_id"], name: "index_users_on_match_id"
  end

  create_table "users_matches", force: :cascade do |t|
    t.integer "user_id"
    t.integer "match_id"
  end

end
