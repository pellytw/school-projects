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

ActiveRecord::Schema[7.2].define(version: 2026_08_09_204627) do
  create_table "localities", force: :cascade do |t|
    t.string "name", null: false
    t.string "province", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "category", default: "institutional", null: false
    t.string "status", default: "draft", null: false
    t.date "starts_on"
    t.date "ends_on"
    t.integer "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_projects_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.string "code"
    t.string "address"
    t.string "level", null: false
    t.integer "locality_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_schools_on_locality_id"
  end

  add_foreign_key "projects", "schools"
  add_foreign_key "schools", "localities"
end
