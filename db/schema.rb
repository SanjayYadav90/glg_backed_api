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

ActiveRecord::Schema.define(version: 2019_06_05_192335) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "role", default: "vendor", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "created_by"
    t.boolean "status"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_categories_on_admin_user_id"
  end

  create_table "cattle_breeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cattle_category_id"
    t.string "title", limit: 70
    t.text "description"
    t.bigint "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cattle_category_id"], name: "index_cattle_breeds_on_cattle_category_id"
  end

  create_table "cattle_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.string "title", limit: 50
    t.text "description"
    t.bigint "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_cattle_categories_on_admin_user_id"
  end

  create_table "cattle_current_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 70
    t.string "calf_gender", limit: 50
    t.string "calf_live_status", limit: 50
    t.datetime "date_of_delivery"
    t.decimal "quantity", precision: 5, scale: 3, default: "0.0"
    t.decimal "calf_consumption", precision: 5, scale: 3, default: "0.0"
    t.text "description"
    t.bigint "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cattle_variants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cattle_breed_id"
    t.string "title", limit: 70
    t.text "description"
    t.bigint "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cattle_breed_id"], name: "index_cattle_variants_on_cattle_breed_id"
  end

  create_table "cattles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.bigint "cattle_variant_id"
    t.string "title", limit: 70
    t.text "description"
    t.datetime "purchase_date"
    t.decimal "amount", precision: 7, scale: 2
    t.string "tag_no"
    t.bigint "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_cattles_on_admin_user_id"
    t.index ["cattle_variant_id"], name: "index_cattles_on_cattle_variant_id"
  end

  create_table "cream_levels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_origin_id"
    t.string "title", limit: 110
    t.decimal "fat_level", precision: 5, scale: 2
    t.text "description"
    t.bigint "created_by"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_origin_id"], name: "index_cream_levels_on_product_origin_id"
  end

  create_table "prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "servise_state_id"
    t.string "title", limit: 110
    t.decimal "price", precision: 7, scale: 2
    t.text "description"
    t.bigint "created_by"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_prices_on_product_id"
    t.index ["servise_state_id"], name: "index_prices_on_servise_state_id"
  end

  create_table "product_origins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "category_id"
    t.string "title", limit: 70
    t.text "description"
    t.bigint "created_by"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_product_origins_on_category_id"
  end

  create_table "product_variants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.string "title", limit: 110
    t.decimal "quantity", precision: 10, scale: 3
    t.string "batch_no"
    t.datetime "used_by"
    t.bigint "created_by"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "category_id"
    t.string "title"
    t.text "description"
    t.decimal "price", precision: 10
    t.boolean "status"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "servise_states", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.string "title", limit: 120
    t.datetime "started_at"
    t.text "remarks"
    t.bigint "created_by"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_servise_states_on_admin_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "salutaion"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "email"
    t.string "mobile"
    t.string "password_digest"
    t.boolean "call_verified"
    t.boolean "premimum"
    t.string "status", default: "inactive", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "admin_users"
  add_foreign_key "cattle_breeds", "cattle_categories"
  add_foreign_key "cattle_categories", "admin_users"
  add_foreign_key "cattle_variants", "cattle_breeds"
  add_foreign_key "cattles", "admin_users"
  add_foreign_key "cattles", "cattle_variants"
  add_foreign_key "cream_levels", "product_origins"
  add_foreign_key "prices", "products"
  add_foreign_key "prices", "servise_states"
  add_foreign_key "product_origins", "categories"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "servise_states", "admin_users"
end
