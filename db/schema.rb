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

ActiveRecord::Schema.define(version: 20141125053348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "problems_count", default: 0, null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "categorizations", force: true do |t|
    t.integer  "problem_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["problem_id"], name: "index_categorizations_on_problem_id", using: :btree

  create_table "judges", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "slug"
    t.integer  "problems_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "judges", ["name"], name: "index_judges_on_name", unique: true, using: :btree
  add_index "judges", ["slug"], name: "index_judges_on_slug", unique: true, using: :btree

  create_table "problems", force: true do |t|
    t.integer  "judge_id"
    t.string   "number",                       null: false
    t.string   "title",                        null: false
    t.string   "url",                          null: false
    t.string   "slug"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "categories_count", default: 0, null: false
    t.integer  "solutions_count",  default: 0, null: false
  end

  add_index "problems", ["created_at"], name: "index_problems_on_created_at", using: :btree
  add_index "problems", ["judge_id", "number"], name: "index_problems_on_judge_id_and_number", unique: true, using: :btree
  add_index "problems", ["judge_id"], name: "index_problems_on_judge_id", using: :btree
  add_index "problems", ["slug"], name: "index_problems_on_slug", unique: true, using: :btree

  create_table "solutions", force: true do |t|
    t.integer  "user_id"
    t.integer  "problem_id"
    t.text     "explanation", null: false
    t.string   "source_code", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "solutions", ["created_at"], name: "index_solutions_on_created_at", using: :btree
  add_index "solutions", ["problem_id"], name: "index_solutions_on_problem_id", using: :btree
  add_index "solutions", ["user_id"], name: "index_solutions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "name"
    t.string   "provider"
    t.string   "provider_uid"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "solutions_count", default: 0, null: false
  end

  add_index "users", ["provider", "provider_uid"], name: "index_users_on_provider_and_provider_uid", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

end
