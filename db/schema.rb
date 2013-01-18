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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121219154845) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "activities", :force => true do |t|
    t.text     "description"
    t.string   "stage_id"
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "artist"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "avatar_parts", :force => true do |t|
    t.integer  "avatar_id"
    t.integer  "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "avatars", :force => true do |t|
    t.integer  "user_id"
    t.string   "gender"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "billings", :force => true do |t|
    t.string   "account"
    t.integer  "user_id"
    t.string   "city"
    t.string   "address"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.boolean  "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "characters", :force => true do |t|
    t.integer  "user_id"
    t.string   "section"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "rate"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "element_stages", :force => true do |t|
    t.integer  "user_id"
    t.string   "types"
    t.integer  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "followers", :force => true do |t|
    t.string   "leader"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invitations", :force => true do |t|
    t.integer  "stage_id"
    t.string   "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "orden"
  end

  create_table "message_read_states", :force => true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "yarn_id"
    t.integer  "user_id"
  end

  create_table "money_returns", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tokens"
    t.date     "date_return"
    t.integer  "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "my_tokens", :force => true do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.string   "operation"
    t.integer  "payment_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
  end

  create_table "orders", :force => true do |t|
    t.integer  "token_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "payments", :force => true do |t|
    t.string   "invoice"
    t.string   "payer_id"
    t.string   "payment_date"
    t.string   "payment_status"
    t.string   "first_name"
    t.string   "mc_fee"
    t.string   "business"
    t.string   "quantity"
    t.string   "payer_email"
    t.string   "payment_type"
    t.string   "last_name"
    t.string   "payment_fee"
    t.string   "item_name"
    t.string   "mc_currency"
    t.string   "item_number"
    t.string   "residence_country"
    t.string   "payment_gross"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "privacies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "option1"
    t.integer  "option2"
    t.integer  "option3"
    t.integer  "option4"
    t.integer  "option5"
    t.string   "option6"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "rates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rate"
    t.integer  "performer"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reports", :force => true do |t|
    t.string   "stage"
    t.string   "reason"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.string   "parent"
    t.string   "img_front"
    t.string   "img_back"
    t.boolean  "free"
    t.string   "gender"
    t.string   "group"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "img_front_file_name"
    t.string   "img_front_content_type"
    t.integer  "img_front_file_size"
    t.datetime "img_front_updated_at"
    t.string   "img_back_file_name"
    t.string   "img_back_content_type"
    t.integer  "img_back_file_size"
    t.datetime "img_back_updated_at"
  end

  create_table "stage_items", :force => true do |t|
    t.integer  "user_id"
    t.string   "item"
    t.integer  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stages", :force => true do |t|
    t.string   "types"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.string   "room_name"
    t.string   "language_content"
    t.string   "rate"
    t.string   "status"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_id"
    t.string   "ticket_type"
    t.string   "ticket_price"
    t.string   "limited_seats"
    t.string   "image"
    t.datetime "live"
    t.string   "design"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "delete_status"
  end

  create_table "sub_categories", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "state"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tickets", :force => true do |t|
    t.integer  "stage_id"
    t.integer  "user_id"
    t.decimal  "price",      :precision => 10, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "tips", :force => true do |t|
    t.integer  "sender"
    t.integer  "receiver"
    t.integer  "tokens"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "stage_id"
  end

  create_table "tokens", :force => true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.float    "price"
    t.boolean  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "image"
    t.text     "about"
    t.string   "name"
    t.string   "gender"
    t.string   "interest"
    t.string   "birthdate"
    t.string   "hometown"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_fb"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "yarn_participants", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "yarn_id"
  end

  create_table "yarns", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
