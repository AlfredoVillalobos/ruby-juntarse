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

ActiveRecord::Schema.define(version: 20171213215309) do

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "from"
    t.string "content"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "disponibilities", force: :cascade do |t|
    t.integer "day"
    t.integer "morning"
    t.integer "afternoon"
    t.integer "night"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_disponibilities_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "invitation_id"
    t.boolean "viewed"
    t.index ["invitation_id"], name: "index_events_on_invitation_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.integer "sport_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_response"
    t.index ["from_id"], name: "index_invitations_on_from_id"
    t.index ["sport_id"], name: "index_invitations_on_sport_id"
    t.index ["to_id"], name: "index_invitations_on_to_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_to_id"
    t.integer "user_from_id"
    t.index ["user_from_id"], name: "index_messages_on_user_from_id"
    t.index ["user_to_id"], name: "index_messages_on_user_to_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_from_id"
    t.integer "user_to_id"
    t.integer "sport_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_notifications_on_sport_id"
    t.index ["user_from_id"], name: "index_notifications_on_user_from_id"
    t.index ["user_to_id"], name: "index_notifications_on_user_to_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "invitation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content"
    t.integer "response"
    t.index ["invitation_id"], name: "index_responses_on_invitation_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_sports", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expertice"
    t.index ["sport_id"], name: "index_user_sports_on_sport_id"
    t.index ["user_id"], name: "index_user_sports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.integer "gender"
    t.integer "age"
    t.boolean "config"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
