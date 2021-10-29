# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_12_051449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "resource_id", limit: 255, null: false
    t.string "resource_type", limit: 255, null: false
    t.integer "author_id"
    t.string "author_type", limit: 255
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "namespace", limit: 255
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id"
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "past_events", id: :serial, force: :cascade do |t|
    t.string "topic", limit: 255
    t.datetime "date"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speaker_assignments", id: false, force: :cascade do |t|
    t.integer "speaker_id"
    t.integer "past_event_id"
  end

  create_table "speakers", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image_url", limit: 255
    t.string "email", limit: 255
  end

  create_table "videos", id: :serial, force: :cascade do |t|
    t.string "url", limit: 255
    t.integer "past_event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
