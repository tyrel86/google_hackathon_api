# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140518013505) do

  create_table "center_vendors", force: true do |t|
    t.integer  "center_id"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "centers", force: true do |t|
    t.string   "name"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custom_field_entries", force: true do |t|
    t.integer  "custom_field_id"
    t.text     "value_text"
    t.string   "value_string"
    t.boolean  "value_bool"
    t.float    "value_float"
    t.integer  "value_integer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "custom_fields", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.float    "lat"
    t.float    "lng"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_vendor_statuses", force: true do |t|
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.boolean  "is_complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.boolean  "is_admin"
    t.boolean  "is_volunteer"
    t.boolean  "is_survivor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "physical_street_1"
    t.string   "physical_street_2"
    t.string   "physical_city"
    t.string   "physical_state"
    t.string   "physical_zipcode"
    t.string   "mailing_street_1"
    t.string   "mailing_street_2"
    t.string   "mailing_city"
    t.string   "mailing_state"
    t.string   "mailing_zipcode"
    t.string   "current_street_1"
    t.string   "current_street_2"
    t.string   "current_city"
    t.string   "current_state"
    t.string   "current_zipcode"
    t.string   "email"
    t.string   "alternate_email"
    t.string   "cell_phone"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "relatives_phone"
    t.string   "alternate_phone"
    t.string   "damage_level"
    t.string   "living_situation"
    t.string   "type_of_dwelling"
    t.string   "insurance_status"
    t.string   "type_of_business_insurance"
    t.string   "name_of_business"
    t.text     "food_concerns"
    t.text     "housing_concerns"
    t.text     "health_concerns"
    t.text     "medicine_concerns"
    t.text     "employment_concerns"
    t.text     "building_structure_concerns"
    t.text     "transporation_concerns"
    t.text     "financial_concerns"
    t.text     "clean_up_concerns"
    t.boolean  "has_unemployment_insurance"
    t.boolean  "has_pets"
    t.boolean  "has_service_animal"
    t.text     "other_concerns"
    t.string   "ssn"
    t.string   "photo_url"
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image_url"
  end

end
