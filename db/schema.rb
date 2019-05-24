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

ActiveRecord::Schema.define(version: 2019_05_24_114505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "permits", force: :cascade do |t|
    t.string "status"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "permit_type"
    t.string "level"
    t.string "location"
    t.string "project_id"
    t.string "permit_number"
    t.string "method_statement"
    t.float "xwidth"
    t.float "xlength"
    t.float "xdepth"
    t.boolean "gas"
    t.boolean "fibre_optic"
    t.boolean "water"
    t.boolean "unknown"
    t.boolean "hv_electricity"
    t.boolean "bt"
    t.boolean "traffic_signal"
    t.boolean "signal_cable"
    t.boolean "lv_electricity"
    t.boolean "drains"
    t.boolean "street_lighting"
    t.boolean "no_services"
    t.boolean "hand_digging"
    t.boolean "confirm_work_package_plan"
    t.boolean "confirm_machine_operator"
    t.boolean "services_protected"
    t.boolean "exlusion_zone"
    t.boolean "buried_cables_identified"
    t.boolean "drawing_updated"
    t.boolean "physical_barrier_available"
    t.boolean "excavation_undermining_foundations"
    t.string "project_manager_phone"
    t.string "cat_scan_model"
    t.string "genny_model"
    t.datetime "calibration_expires"
    t.string "cat_scanner_serial"
    t.string "genny_serial"
    t.string "cat_genny_operator"
    t.boolean "cat_mode_power"
    t.boolean "cat_mode_radio"
    t.boolean "cat_mode_transmitter"
    t.text "works_description"
    t.bigint "author_id"
    t.bigint "approver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["approver_id"], name: "index_permits_on_approver_id"
    t.index ["author_id"], name: "index_permits_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approver", default: false
    t.boolean "author", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "permits", "users", column: "approver_id"
  add_foreign_key "permits", "users", column: "author_id"
end
