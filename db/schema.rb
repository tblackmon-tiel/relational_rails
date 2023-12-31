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

ActiveRecord::Schema[7.0].define(version: 2023_08_29_055534) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "birds", force: :cascade do |t|
    t.string "name"
    t.integer "band_id"
    t.integer "age"
    t.boolean "is_bonded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "flock_id", null: false
    t.index ["flock_id"], name: "index_birds_on_flock_id"
  end

  create_table "flocks", force: :cascade do |t|
    t.string "name"
    t.integer "cage_number"
    t.boolean "accepts_new_birds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "birds", "flocks"
end
