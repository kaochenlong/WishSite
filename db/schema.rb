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

ActiveRecord::Schema.define(version: 2022_11_22_060649) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "deleted_at"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "wish_list_id"
    t.index ["deleted_at"], name: "index_comments_on_deleted_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["wish_list_id"], name: "index_comments_on_wish_list_id"
  end

  create_table "like_wish_lists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "wish_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_like_wish_lists_on_user_id"
    t.index ["wish_list_id"], name: "index_like_wish_lists_on_wish_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wish_lists", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "online", default: false
    t.integer "user_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_wish_lists_on_deleted_at"
    t.index ["user_id"], name: "index_wish_lists_on_user_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "like_wish_lists", "users"
  add_foreign_key "like_wish_lists", "wish_lists"
end
