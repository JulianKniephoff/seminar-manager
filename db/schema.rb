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

ActiveRecord::Schema.define(version: 20160416133143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "topic_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
  add_index "comments", ["topic_id"], name: "index_comments_on_topic_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["topic_id"], name: "index_likes_on_topic_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "materials", force: :cascade do |t|
    t.string   "description"
    t.integer  "talk_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "talks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "speaker_id"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "talks", ["speaker_id"], name: "index_talks_on_speaker_id", using: :btree

  create_table "talks_topics", id: false, force: :cascade do |t|
    t.integer "talk_id",  null: false
    t.integer "topic_id", null: false
  end

  add_index "talks_topics", ["talk_id", "topic_id"], name: "index_talks_topics_on_talk_id_and_topic_id", using: :btree
  add_index "talks_topics", ["topic_id", "talk_id"], name: "index_talks_topics_on_topic_id_and_talk_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "author_id"
    t.integer  "likes_count"
  end

  add_index "topics", ["author_id"], name: "index_topics_on_author_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.boolean  "admin"
  end

  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "likes", "topics"
  add_foreign_key "likes", "users"
  add_foreign_key "talks", "users", column: "speaker_id"
  add_foreign_key "topics", "users", column: "author_id"
end
