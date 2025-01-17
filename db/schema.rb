# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_01_17_051036) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "past_events", id: :serial, force: :cascade do |t|
    t.string "topic", limit: 255
    t.datetime "date", precision: nil
    t.text "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "speaker_assignments", force: :cascade do |t|
    t.integer "speaker_id"
    t.integer "past_event_id"
    t.index ["past_event_id", "speaker_id"], name: "index_speaker_assignments_on_past_event_id_and_speaker_id"
  end

  create_table "speakers", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "bio"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "image_url", limit: 255
    t.string "email", limit: 255
  end

  create_table "videos", id: :serial, force: :cascade do |t|
    t.string "url", limit: 255
    t.integer "past_event_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

end
