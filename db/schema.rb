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

ActiveRecord::Schema[7.1].define(version: 2024_05_10_102227) do
  create_table "clickable_contents", charset: "utf8mb4", force: :cascade do |t|
    t.text "content_code"
    t.bigint "task_id", null: false
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_clickable_contents_on_task_id"
  end

  create_table "hints", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_hints_on_task_id"
  end

  create_table "lessons", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons_tasks", id: false, charset: "utf8mb4", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "task_id", null: false
    t.index ["lesson_id", "task_id"], name: "index_lessons_tasks_on_lesson_id_and_task_id"
    t.index ["task_id", "lesson_id"], name: "index_lessons_tasks_on_task_id_and_lesson_id"
  end

  create_table "task_elements", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.string "external_code"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "money", precision: 10
    t.integer "experience_points"
    t.index ["task_id"], name: "index_task_elements_on_task_id"
  end

  create_table "tasks", charset: "utf8mb4", force: :cascade do |t|
    t.string "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_hints", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_task_id", null: false
    t.bigint "hint_id", null: false
    t.boolean "bought"
    t.datetime "bought_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hint_id"], name: "index_user_hints_on_hint_id"
    t.index ["user_task_id"], name: "index_user_hints_on_user_task_id"
  end

  create_table "user_lessons", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "lesson_id", null: false
    t.integer "status"
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_user_lessons_on_lesson_id"
    t.index ["user_id", "lesson_id"], name: "index_user_lessons_on_user_id_and_lesson_id", unique: true
    t.index ["user_id"], name: "index_user_lessons_on_user_id"
  end

  create_table "user_task_elements", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_task_id", null: false
    t.bigint "task_element_id", null: false
    t.boolean "clicked"
    t.boolean "clicked_correctly"
    t.datetime "clicked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_element_id"], name: "index_user_task_elements_on_task_element_id"
    t.index ["user_task_id"], name: "index_user_task_elements_on_user_task_id"
  end

  create_table "user_tasks", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_lesson_id", null: false
    t.bigint "task_id", null: false
    t.integer "status"
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_user_tasks_on_task_id"
    t.index ["user_lesson_id", "task_id"], name: "index_user_tasks_on_user_lesson_id_and_task_id", unique: true
    t.index ["user_lesson_id"], name: "index_user_tasks_on_user_lesson_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "health", default: 0
    t.decimal "money", precision: 10, default: "0"
    t.integer "experience_points", default: 0
    t.integer "level", default: 0
    t.datetime "last_health_restored_at"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "clickable_contents", "tasks"
  add_foreign_key "hints", "tasks"
  add_foreign_key "task_elements", "tasks"
  add_foreign_key "user_hints", "hints"
  add_foreign_key "user_hints", "user_tasks"
  add_foreign_key "user_lessons", "lessons"
  add_foreign_key "user_lessons", "users"
  add_foreign_key "user_task_elements", "task_elements"
  add_foreign_key "user_task_elements", "user_tasks"
  add_foreign_key "user_tasks", "tasks"
  add_foreign_key "user_tasks", "user_lessons"
end
