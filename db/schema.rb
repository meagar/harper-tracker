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

ActiveRecord::Schema.define(version: 20170825123057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "changings", force: :cascade do |t|
    t.integer "poop"
    t.integer "poop_type"
    t.integer "pee"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "change_time", null: false
    t.index ["change_time"], name: "index_changings_on_change_time"
  end

  create_table "feedings", force: :cascade do |t|
    t.integer "amount"
    t.boolean "formula"
    t.boolean "milk"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time", null: false
    t.integer "left_breast", null: false
    t.integer "right_breast", null: false
    t.index ["start_time"], name: "index_feedings_on_start_time"
  end

  create_table "weigh_ins", force: :cascade do |t|
    t.integer "weight", null: false
    t.datetime "weigh_time", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weigh_time"], name: "index_weigh_ins_on_weigh_time"
  end

end
