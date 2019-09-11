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

ActiveRecord::Schema.define(version: 2019_09_11_200105) do

  create_table "airports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "iata_code"
    t.string "description"
    t.decimal "temperature", precision: 20, scale: 15
    t.decimal "relative_humidity", precision: 20, scale: 15
    t.decimal "wind_speed", precision: 20, scale: 15
    t.decimal "long", precision: 20, scale: 15
    t.decimal "lat", precision: 20, scale: 15
    t.integer "wind_direction"
    t.string "time_zone"
    t.string "data_time"
    t.boolean "show_on_dashboard"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iata_code"], name: "index_airports_on_iata_code"
    t.index ["name"], name: "index_airports_on_name"
  end

end
