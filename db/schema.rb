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

ActiveRecord::Schema.define(version: 20151125055555) do

  create_table "abilities", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "profession_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "abilities", ["profession_id"], name: "index_abilities_on_profession_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "assistant_teams", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "team_id",      limit: 4
    t.integer  "relativeCode", limit: 4
    t.boolean  "active",                 default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "assistant_teams", ["user_id", "team_id", "relativeCode"], name: "user_id", unique: true, using: :btree

  create_table "baicizhan_words", force: :cascade do |t|
    t.integer "topic_id",      limit: 4
    t.integer "word_level_id", limit: 4
    t.integer "unit_id",       limit: 4,   default: 0
    t.string  "word",          limit: 45
    t.string  "mean",          limit: 255
    t.string  "sentence",      limit: 255
  end

  add_index "baicizhan_words", ["word"], name: "index_word", using: :btree

  create_table "bb_all_in_one_roadmaps", force: :cascade do |t|
    t.text     "roadmap_json", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bb_comments", force: :cascade do |t|
    t.integer  "word_id",       limit: 4
    t.string   "comment",       limit: 255
    t.integer  "count",         limit: 4,   default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "bb_users_name", limit: 11,  default: "匿名"
  end

  create_table "bb_courses", force: :cascade do |t|
    t.integer  "current_word_level_id", limit: 4, default: 1
    t.integer  "current_unit_id",       limit: 4, default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bb_jobs", force: :cascade do |t|
    t.integer "bb_word_id",        limit: 4,                  null: false
    t.integer "tag_by",            limit: 4
    t.integer "story_by",          limit: 4
    t.integer "story_audit_by",    limit: 4
    t.integer "zip_upload_by",     limit: 4
    t.integer "img_edit_by",       limit: 4
    t.integer "img_audit_1_by",    limit: 4
    t.string  "img_audit_2_by",    limit: 255, default: "[]"
    t.integer "img_audit_2_score", limit: 4,   default: 0
    t.integer "audio_edit_by",     limit: 4
    t.integer "audio_audit_by",    limit: 4
    t.integer "done_list_by",      limit: 4
  end

  add_index "bb_jobs", ["bb_word_id"], name: "name_uniq", unique: true, using: :btree

  create_table "bb_line_unit_records", force: :cascade do |t|
    t.integer  "word_level_id", limit: 4,     null: false
    t.integer  "unit_id",       limit: 4,     null: false
    t.integer  "status",        limit: 4
    t.text     "exception",     limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "bb_line_word_records", force: :cascade do |t|
    t.integer  "word_level_id", limit: 4,     null: false
    t.integer  "unit_id",       limit: 4,     null: false
    t.string   "word",          limit: 255
    t.integer  "status",        limit: 4
    t.text     "exception",     limit: 65535
    t.datetime "updated_at",                  null: false
    t.datetime "created_at",                  null: false
  end

  create_table "bb_material_level_units", force: :cascade do |t|
    t.integer  "word_level_id", limit: 4
    t.integer  "unit_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_material_level_units", ["word_level_id", "unit_id"], name: "index_level_unit", unique: true, using: :btree

  create_table "bb_online_class_learned_words", force: :cascade do |t|
    t.integer  "class_id",      limit: 4,     null: false
    t.integer  "word_level_id", limit: 4,     null: false
    t.integer  "unit_id",       limit: 2,     null: false
    t.binary   "list",          limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "bb_online_class_learned_words", ["class_id", "word_level_id", "unit_id"], name: "uniq_on_class_learned_words", unique: true, using: :btree

  create_table "bb_online_class_roadmaps", force: :cascade do |t|
    t.integer  "class_id",      limit: 4,                 null: false
    t.integer  "word_level_id", limit: 4,                 null: false
    t.integer  "unit_id",       limit: 4,                 null: false
    t.text     "roadmap_json",  limit: 65535,             null: false
    t.integer  "words_count",   limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_online_class_roadmaps", ["class_id", "word_level_id", "unit_id"], name: "index_uniq", unique: true, using: :btree

  create_table "bb_online_class_roadmaps_bak", id: false, force: :cascade do |t|
    t.integer  "id",            limit: 4,     default: 0, null: false
    t.integer  "class_id",      limit: 4,                 null: false
    t.integer  "word_level_id", limit: 4,                 null: false
    t.integer  "unit_id",       limit: 4,                 null: false
    t.text     "roadmap_json",  limit: 65535,             null: false
    t.integer  "words_count",   limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bb_online_classes", primary_key: "class_id", force: :cascade do |t|
    t.string   "name",          limit: 255, null: false
    t.integer  "word_level_id", limit: 4
    t.string   "flag",          limit: 45
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bb_online_grades", force: :cascade do |t|
    t.string "name", limit: 45
  end

  add_index "bb_online_grades", ["name"], name: "name_UNIQUE", unique: true, using: :btree

  create_table "bb_online_histories", force: :cascade do |t|
    t.integer  "new_users",       limit: 4,    default: 0
    t.integer  "valid_new_users", limit: 4,    default: 0
    t.integer  "pv",              limit: 4,    default: 0
    t.integer  "vaild_pv",        limit: 4,    default: 0
    t.string   "online_users",    limit: 1000
    t.string   "use_time",        limit: 1000
    t.date     "recode_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bb_online_personal_roadmaps", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,                 null: false
    t.integer  "word_level_id",   limit: 4,                 null: false
    t.integer  "unit_id",         limit: 4,                 null: false
    t.integer  "word_level_type", limit: 4,                 null: false
    t.text     "roadmap_json",    limit: 65535,             null: false
    t.integer  "words_count",     limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_online_personal_roadmaps", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "index_uniq", unique: true, using: :btree

  create_table "bb_online_personal_roadmaps_bak", id: false, force: :cascade do |t|
    t.integer  "id",              limit: 4,     default: 0, null: false
    t.integer  "user_id",         limit: 4,                 null: false
    t.integer  "word_level_id",   limit: 4,                 null: false
    t.integer  "unit_id",         limit: 4,                 null: false
    t.integer  "word_level_type", limit: 4,                 null: false
    t.text     "roadmap_json",    limit: 65535,             null: false
    t.integer  "words_count",     limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bb_online_school_classes", force: :cascade do |t|
    t.integer "school_id",  limit: 4
    t.integer "grade_id",   limit: 4
    t.integer "class_id",   limit: 4
    t.string  "class_name", limit: 255
  end

  add_index "bb_online_school_classes", ["school_id", "grade_id", "class_id"], name: "unique_s_g_c", unique: true, using: :btree

  create_table "bb_online_school_students", force: :cascade do |t|
    t.integer "class_id",      limit: 4,              null: false
    t.string  "name",          limit: 45,             null: false
    t.string  "nick_name",     limit: 45
    t.string  "email",         limit: 45
    t.integer "role",          limit: 4,  default: 0, null: false
    t.string  "student_num",   limit: 45
    t.integer "wait_code",     limit: 4,  default: 3
    t.integer "class_unit_id", limit: 4
    t.string  "school_flag",   limit: 45
  end

  add_index "bb_online_school_students", ["class_id", "name"], name: "index_c_name", using: :btree
  add_index "bb_online_school_students", ["class_id", "student_num"], name: "unique_c_num", unique: true, using: :btree

  create_table "bb_online_schools", force: :cascade do |t|
    t.integer "flag",        limit: 4
    t.string  "name",        limit: 255, null: false
    t.string  "description", limit: 255
  end

  add_index "bb_online_schools", ["name"], name: "name_UNIQUE", unique: true, using: :btree

  create_table "bb_online_teacher_classes", force: :cascade do |t|
    t.integer  "class_id",   limit: 4, null: false
    t.integer  "teacher_id", limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_online_teacher_classes", ["class_id"], name: "uniq_index", unique: true, using: :btree

  create_table "bb_online_user_actions", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "class_id",         limit: 4
    t.integer  "is_teacher",       limit: 4
    t.string   "action_name",      limit: 255
    t.string   "action_method",    limit: 45
    t.string   "action_parameter", limit: 255
    t.datetime "action_time"
    t.string   "remote_ip",        limit: 45
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_online_user_actions", ["action_name"], name: "index_action_name", using: :btree
  add_index "bb_online_user_actions", ["action_time"], name: "index_action_time", using: :btree
  add_index "bb_online_user_actions", ["user_id"], name: "index_user_id", using: :btree

  create_table "bb_online_user_learned_words_t0", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t0", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t10", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t10", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t11", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t11", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t12", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t12", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t13", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t13", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t14", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t14", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t15", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t15", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t16", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t16", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t17", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t17", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t18", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t18", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t19", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t19", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t2", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t2", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t20", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t20", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t21", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t21", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t22", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t22", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t23", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t23", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t24", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t24", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t3", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t3", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t4", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t4", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t5", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t5", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t6", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t6", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t7", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t7", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t8", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t8", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_t9", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_t9", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_user_learned_words_template", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,     null: false
    t.integer  "word_level_id",   limit: 4,     null: false
    t.integer  "unit_id",         limit: 2,     null: false
    t.integer  "word_level_type", limit: 4,     null: false
    t.binary   "list",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bb_online_user_learned_words_template", ["user_id", "word_level_id", "unit_id", "word_level_type"], name: "uniq_on_user_learned_words", unique: true, using: :btree

  create_table "bb_online_users", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,               null: false
    t.integer  "class_id",      limit: 4
    t.integer  "is_teacher",    limit: 4
    t.integer  "role",          limit: 4,   default: 0
    t.string   "email",         limit: 255
    t.string   "nick_name",     limit: 255
    t.integer  "word_level_id", limit: 4
    t.integer  "unit_id",       limit: 4
    t.integer  "class_unit_id", limit: 4
    t.integer  "wait_code",     limit: 4,   default: 0
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_online_users", ["class_id", "is_teacher"], name: "index_cid_is_teacher", using: :btree
  add_index "bb_online_users", ["class_id", "role"], name: "index_cid_role", using: :btree
  add_index "bb_online_users", ["class_id", "wait_code", "user_id"], name: "index_cid_uid", using: :btree
  add_index "bb_online_users", ["email"], name: "uniq_email", unique: true, using: :btree
  add_index "bb_online_users", ["user_id"], name: "uniq_user_id", unique: true, using: :btree

  create_table "bb_online_waiting_words", force: :cascade do |t|
    t.integer  "class_id",      limit: 4,   null: false
    t.integer  "word_level_id", limit: 4,   null: false
    t.integer  "unit_id",       limit: 2,   null: false
    t.string   "word",          limit: 255, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "bb_online_waiting_words", ["class_id", "word_level_id", "unit_id"], name: "uniq_online_waiting_words", unique: true, using: :btree

  create_table "bb_online_word_book_topics", force: :cascade do |t|
    t.integer  "topic_id",       limit: 4,    null: false
    t.integer  "word_level_id",  limit: 4,    null: false
    t.integer  "unit_id",        limit: 4,    null: false
    t.string   "word",           limit: 255,  null: false
    t.string   "word_audio",     limit: 255
    t.string   "mean_cn",        limit: 255
    t.integer  "hint_id",        limit: 4,    null: false
    t.integer  "priority",       limit: 4
    t.string   "image",          limit: 1024
    t.string   "sentence",       limit: 255
    t.string   "sentence_trans", limit: 255
    t.string   "sentence_audio", limit: 255
    t.string   "syllable",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_online_word_book_topics", ["topic_id", "word_level_id", "unit_id"], name: "index_tidwiduid", using: :btree
  add_index "bb_online_word_book_topics", ["word_level_id", "unit_id"], name: "index_wl_unit", using: :btree

  create_table "bb_online_word_level_roadmaps", force: :cascade do |t|
    t.integer  "word_level_id", limit: 4,                 null: false
    t.integer  "unit_id",       limit: 4,                 null: false
    t.text     "roadmap_json",  limit: 65535,             null: false
    t.integer  "words_count",   limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_online_word_level_roadmaps", ["word_level_id", "unit_id"], name: "word_level_id", unique: true, using: :btree

  create_table "bb_syllables", force: :cascade do |t|
    t.string   "word",       limit: 45, null: false
    t.string   "syllable",   limit: 45, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_syllables", ["word", "syllable"], name: "index_word", using: :btree

  create_table "bb_tags", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  add_index "bb_tags", ["name"], name: "name_uniq", unique: true, using: :btree

  create_table "bb_teach_materials", force: :cascade do |t|
    t.string  "word",          limit: 255
    t.string  "mean_cn",       limit: 255
    t.integer "word_level_id", limit: 4
    t.integer "unit_id",       limit: 4
  end

  add_index "bb_teach_materials", ["word"], name: "index_word", using: :btree
  add_index "bb_teach_materials", ["word_level_id", "unit_id"], name: "index_level_unit", using: :btree

  create_table "bb_type_hints", force: :cascade do |t|
    t.string   "name_cn",    limit: 255, null: false
    t.string   "name_en",    limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_type_hints", ["name_en"], name: "index_uniq", unique: true, using: :btree

  create_table "bb_user_pays", force: :cascade do |t|
    t.string "user_id",          limit: 255,               null: false
    t.float  "story_task",       limit: 53,  default: 0.0
    t.float  "zip_upload_task",  limit: 53,  default: 0.0
    t.float  "img_audit_1_task", limit: 53,  default: 0.0
    t.float  "audio_edit_task",  limit: 53,  default: 0.0
  end

  add_index "bb_user_pays", ["user_id"], name: "user_id_uniq", unique: true, using: :btree

  create_table "bb_users", force: :cascade do |t|
    t.string  "name",   limit: 255,             null: false
    t.string  "passwd", limit: 255,             null: false
    t.string  "role",   limit: 255,             null: false
    t.integer "tag_id", limit: 4,   default: 0
  end

  add_index "bb_users", ["name"], name: "name_uniq", unique: true, using: :btree

  create_table "bb_word_ids", force: :cascade do |t|
    t.integer  "max_bb_word_id", limit: 4, default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bb_word_level_roadmaps", force: :cascade do |t|
    t.integer  "word_level_id", limit: 4,                 null: false
    t.integer  "unit_id",       limit: 4,                 null: false
    t.text     "roadmap_json",  limit: 65535,             null: false
    t.integer  "words_count",   limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_word_level_roadmaps", ["word_level_id", "unit_id"], name: "word_level_id", unique: true, using: :btree

  create_table "bb_word_level_sequences", force: :cascade do |t|
    t.string   "sequence_json", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bb_word_level_units", force: :cascade do |t|
    t.integer  "word_level_id", limit: 4,                  null: false
    t.integer  "unit_id",       limit: 4,                  null: false
    t.integer  "words_count",   limit: 4, default: 0
    t.string   "data_source",   limit: 5, default: "http"
    t.integer  "state",         limit: 4, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_word_level_units", ["word_level_id", "unit_id", "state", "data_source"], name: "word_level_id", unique: true, using: :btree

  create_table "bb_word_levels", force: :cascade do |t|
    t.integer  "word_level_id", limit: 4,               null: false
    t.string   "name_cn",       limit: 255,             null: false
    t.string   "name_en",       limit: 255
    t.integer  "units",         limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bb_word_levels", ["word_level_id"], name: "index_uniq", unique: true, using: :btree

  create_table "bb_word_storys", force: :cascade do |t|
    t.integer  "bb_word_id", limit: 4,                 null: false
    t.text     "story",      limit: 65535
    t.integer  "passed",     limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bb_words", force: :cascade do |t|
    t.integer  "word_id",             limit: 4,                null: false
    t.integer  "word_level_id",       limit: 4,                null: false
    t.integer  "unit_id",             limit: 4,                null: false
    t.string   "word",                limit: 255,              null: false
    t.string   "word_audio",          limit: 255
    t.string   "mean_cn",             limit: 255
    t.integer  "tag_id",              limit: 4,   default: 0
    t.integer  "status",              limit: 4,   default: 0
    t.string   "comment",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "PI_num",              limit: 4,   default: 0
    t.string   "accent",              limit: 255
    t.integer  "topic_id",            limit: 4,   default: -1, null: false
    t.integer  "word_book_topics_id", limit: 4
  end

  add_index "bb_words", ["status"], name: "index_status", using: :btree
  add_index "bb_words", ["word", "mean_cn"], name: "index_word_mean_cn", using: :btree
  add_index "bb_words", ["word_id", "status"], name: "index_word_id_status", using: :btree
  add_index "bb_words", ["word_level_id", "unit_id", "word"], name: "index_uniq", unique: true, using: :btree

  create_table "bb_words_ext", force: :cascade do |t|
    t.integer  "bb_word_id",            limit: 4,                 null: false
    t.integer  "priority",              limit: 4,                 null: false
    t.integer  "hint_id",               limit: 4,                 null: false
    t.string   "sentence",              limit: 255
    t.string   "sentence_trans",        limit: 255
    t.string   "image",                 limit: 1024
    t.string   "sentence_audio",        limit: 255
    t.integer  "deleted",               limit: 4,    default: 1
    t.integer  "img_check_id",          limit: 4,    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "word_course_topics_id", limit: 4,    default: -1
  end

  add_index "bb_words_ext", ["bb_word_id", "priority"], name: "index_word", using: :btree

  create_table "books", force: :cascade do |t|
    t.string "book_name", limit: 255, null: false
    t.string "book_type", limit: 255
  end

  create_table "charts", force: :cascade do |t|
    t.integer  "team_id",      limit: 4
    t.date     "startDate"
    t.date     "endDate"
    t.integer  "createdBy",    limit: 4
    t.boolean  "isConfirmed",             default: false
    t.boolean  "isDownloaded",            default: false
    t.boolean  "active",                  default: true
    t.float    "itemPrice",    limit: 24, default: 0.0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter",  limit: 255
    t.text     "body",       limit: 65535
    t.integer  "article_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "dictionaries", force: :cascade do |t|
    t.string "name",            limit: 255
    t.string "description",     limit: 255
    t.string "dictionary_json", limit: 255
    t.binary "word_json",       limit: 4294967295
  end

  create_table "max_topic_id", force: :cascade do |t|
    t.integer  "max_id",     limit: 4, default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "nickName",      limit: 255, default: ""
    t.integer  "sex",           limit: 4,   default: 3
    t.date     "birthday"
    t.string   "constellation", limit: 255
    t.string   "major",         limit: 255
    t.string   "school",        limit: 255
    t.integer  "team_id",       limit: 4
    t.string   "station",       limit: 255
    t.string   "cardCounter",   limit: 255
    t.string   "bankName",      limit: 255
    t.string   "bankPoster",    limit: 255
    t.string   "cardOwner",     limit: 255
    t.string   "alipayCounter", limit: 255
    t.string   "tel",           limit: 255
    t.float    "dailyWage",     limit: 24,  default: 100.0
    t.boolean  "isSingle",                  default: false
    t.string   "habits",        limit: 255
    t.boolean  "active",                    default: true
    t.date     "leaveTime"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "members", ["team_id", "name", "nickName"], name: "team_id", unique: true, using: :btree

  create_table "new_word_topic_id", force: :cascade do |t|
    t.integer  "bb_word_id", limit: 4
    t.integer  "topic_id",   limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
  end

  add_index "new_word_topic_id", ["topic_id"], name: "ukey", unique: true, using: :btree

  create_table "payrolls", force: :cascade do |t|
    t.integer  "chart_id",   limit: 4
    t.integer  "member_id",  limit: 4
    t.float    "workDays",   limit: 24,  default: 0.0
    t.float    "dailyWage",  limit: 24,  default: 100.0
    t.float    "workItems",  limit: 24,  default: 0.0
    t.float    "itemPrice",  limit: 24,  default: 0.0
    t.float    "wageTime",   limit: 24,  default: 1.0
    t.float    "calcWage",   limit: 24,  default: 0.0
    t.float    "extralWage", limit: 24,  default: 0.0
    t.float    "totalWage",  limit: 24,  default: 0.0
    t.string   "notes",      limit: 255
    t.boolean  "active",                 default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "payrolls", ["chart_id", "member_id", "active"], name: "chart_id", unique: true, using: :btree

  create_table "pi_pattern_user_actions", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,   null: false
    t.string   "group_id",        limit: 11
    t.string   "action_name",     limit: 255
    t.string   "action_method",   limit: 255
    t.string   "action_prameter", limit: 255
    t.string   "action_time",     limit: 255
    t.string   "remote_ip",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pi_pattern_user_actions", ["user_id"], name: "uniq_user_id", unique: true, using: :btree

  create_table "pi_pattern_users", force: :cascade do |t|
    t.integer  "user_id",   limit: 4,   null: false
    t.string   "group_id",  limit: 11
    t.integer  "share",     limit: 4
    t.integer  "download",  limit: 4
    t.integer  "learnword", limit: 4
    t.string   "feedback",  limit: 255
    t.datetime "start_at"
    t.datetime "end_at"
  end

  add_index "pi_pattern_users", ["user_id"], name: "uniq_user_id", unique: true, using: :btree

  create_table "pi_words", force: :cascade do |t|
    t.string "pi_word",        limit: 45,   null: false
    t.string "image",          limit: 100
    t.string "mean_cn",        limit: 1000
    t.string "sentence",       limit: 2000
    t.string "sentence_trans", limit: 2000
  end

  create_table "professions", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "st_professions", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.string   "user_name",   limit: 255
    t.integer  "level",       limit: 4
    t.string   "status",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "st_skills", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "level",       limit: 4
    t.integer  "maxlevel",    limit: 4
    t.text     "description", limit: 65535
    t.string   "approach",    limit: 255
    t.string   "icon",        limit: 255
    t.string   "before",      limit: 255
    t.string   "after",       limit: 255
    t.string   "bonus",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "desc",       limit: 65535
    t.boolean  "active",                   default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "teams", ["name"], name: "name", unique: true, using: :btree

  create_table "test_increment", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "fullName",   limit: 255
    t.string   "password",   limit: 255
    t.integer  "userTypeId", limit: 4,   default: 4
    t.boolean  "active",                 default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "users", ["username"], name: "username", unique: true, using: :btree

  create_table "word_book_topics", force: :cascade do |t|
    t.integer  "topic_id",             limit: 4,                   null: false
    t.integer  "word_level_id",        limit: 4,                   null: false
    t.integer  "tag_id",               limit: 4,   default: 0
    t.integer  "cur_version",          limit: 4,   default: 1
    t.integer  "en_word_id",           limit: 4,                   null: false
    t.string   "word",                 limit: 255,                 null: false
    t.string   "word_audio_name",      limit: 255,                 null: false
    t.string   "word_variants",        limit: 255
    t.string   "image_file",           limit: 255,                 null: false
    t.integer  "image_size",           limit: 4,                   null: false
    t.string   "accent",               limit: 255
    t.string   "mean_cn",              limit: 255
    t.string   "mean_jp",              limit: 255
    t.string   "mean_en",              limit: 255
    t.string   "etyma",                limit: 255
    t.string   "similar_words",        limit: 255
    t.string   "example_keyword",      limit: 255
    t.string   "short_phrase",         limit: 255
    t.string   "thumbnail_image",      limit: 255
    t.string   "deformation_img_url",  limit: 255
    t.integer  "deformation_img_size", limit: 4,   default: 0,     null: false
    t.string   "deformation_desc",     limit: 255
    t.string   "sentence",             limit: 255
    t.string   "sentence_trans",       limit: 255
    t.string   "audio_file",           limit: 255
    t.string   "form_in_sentence",     limit: 255
    t.boolean  "is_abandon",                       default: false
    t.string   "update_flag",          limit: 255
    t.string   "update_flag_md5",      limit: 255
    t.string   "assets_zpk",           limit: 255
    t.string   "syllable",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "word_book_topics", ["tag_id"], name: "idx_tag_id_on_tag_id", using: :btree
  add_index "word_book_topics", ["topic_id", "word_level_id", "tag_id"], name: "index_topicid_bookid_tagid", unique: true, using: :btree
  add_index "word_book_topics", ["topic_id"], name: "index_word_topics_on_tid", using: :btree
  add_index "word_book_topics", ["word", "word_level_id"], name: "index_w_and_wid", using: :btree
  add_index "word_book_topics", ["word"], name: "index_word_topics_on_word", using: :btree

  create_table "word_topics", force: :cascade do |t|
    t.integer  "topic_id",             limit: 4,                                   null: false
    t.integer  "en_word_id",           limit: 4,                                   null: false
    t.string   "word",                 limit: 255,                                 null: false
    t.integer  "special_type",         limit: 4,   default: 0
    t.string   "word_audio_name",      limit: 255
    t.string   "word_variants",        limit: 255
    t.string   "image_file",           limit: 255,                                 null: false
    t.integer  "image_size",           limit: 4,                                   null: false
    t.string   "accent",               limit: 255
    t.string   "mean_cn",              limit: 255
    t.string   "mean_jp",              limit: 255
    t.string   "mean_en",              limit: 255
    t.string   "etyma",                limit: 255
    t.string   "example_keyword",      limit: 255
    t.string   "short_phrase",         limit: 255
    t.string   "thumbnail_image",      limit: 255
    t.string   "deformation_img_url",  limit: 255
    t.integer  "deformation_img_size", limit: 4,   default: 0,                     null: false
    t.string   "deformation_desc",     limit: 255
    t.string   "sentence",             limit: 255
    t.string   "sentence_trans",       limit: 255
    t.string   "audio_file",           limit: 255
    t.string   "form_in_sentence",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_abandon",                       default: false
    t.string   "update_flag",          limit: 255
    t.datetime "old_updated_at",                   default: '2012-01-01 12:00:00'
    t.string   "old_update_flag",      limit: 255
    t.string   "syllable",             limit: 255
  end

  add_index "word_topics", ["en_word_id"], name: "idx_en_word_id", using: :btree
  add_index "word_topics", ["topic_id", "update_flag"], name: "index_update_flag_on_topic_id", using: :btree
  add_index "word_topics", ["topic_id"], name: "index_word_topics_on_topic_id", unique: true, using: :btree
  add_index "word_topics", ["updated_at"], name: "idx_word_topic_update_time", using: :btree
  add_index "word_topics", ["word"], name: "index_word_topics_on_word", using: :btree

  create_table "words", force: :cascade do |t|
    t.string  "word",    limit: 255, null: false
    t.integer "book_id", limit: 4,   null: false
  end

  add_foreign_key "abilities", "professions"
  add_foreign_key "comments", "articles"
end
