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

ActiveRecord::Schema.define(version: 20151001193615) do

  create_table "goals", force: :cascade do |t|
    t.text     "text"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "goals", ["lesson_id"], name: "index_goals_on_lesson_id"
  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "lessons", force: :cascade do |t|
    t.date     "date"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lessons", ["school_id"], name: "index_lessons_on_school_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.integer  "attendance"
    t.integer  "week_number"
    t.boolean  "teacher_attended_whole_lesson"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "surveys", ["lesson_id"], name: "index_surveys_on_lesson_id"
  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "admin"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",                    default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean  "monday",                       default: false
    t.boolean  "tuesday",                      default: false
    t.boolean  "wednesday",                    default: false
    t.boolean  "thursday",                     default: false
    t.boolean  "friday",                       default: false
    t.integer  "phone",             limit: 10
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
