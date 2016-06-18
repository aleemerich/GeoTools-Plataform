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

ActiveRecord::Schema.define(:version => 20131204210624) do

  create_table "alfa_companies", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "cnpj"
    t.string   "ie"
    t.string   "full_address"
    t.string   "contact_name"
    t.string   "contact_tel"
    t.string   "contact_cell"
    t.boolean  "blocked",         :default => false
    t.date     "date_expiration"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "deleted",         :default => false
  end

  add_index "alfa_companies", ["company_id"], :name => "index_alfa_companies_on_company_id"

  create_table "alfa_company_layers", :force => true do |t|
    t.integer  "company_id"
    t.integer  "layer_id"
    t.date     "date_expirate"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "alfa_company_layers", ["company_id"], :name => "index_alfa_company_layers_on_company_id"
  add_index "alfa_company_layers", ["layer_id"], :name => "index_alfa_company_layers_on_layer_id"

  create_table "alfa_layers", :force => true do |t|
    t.integer  "worktable_id"
    t.integer  "user_id"
    t.string   "name"
    t.integer  "geometry_type"
    t.string   "geometry_field"
    t.string   "geometry_field_aux"
    t.string   "outline_color"
    t.string   "fill_color"
    t.decimal  "fill_opacity",       :precision => 4,  :scale => 3
    t.string   "label"
    t.string   "external_graphic"
    t.decimal  "maximum_zoom",       :precision => 10, :scale => 0
    t.decimal  "minimum_zoom",       :precision => 10, :scale => 0
    t.text     "observation"
    t.boolean  "deleted",                                           :default => false
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
    t.text     "fields_show"
  end

  add_index "alfa_layers", ["worktable_id"], :name => "index_alfa_layers_on_worktable_id"

  create_table "alfa_script_details", :force => true do |t|
    t.integer  "script_id"
    t.string   "function_exec"
    t.string   "description"
    t.text     "params"
    t.integer  "order"
    t.boolean  "remote"
    t.boolean  "deleted",       :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "alfa_script_details", ["script_id"], :name => "index_alfa_script_details_on_company_id"

  create_table "alfa_scripts", :force => true do |t|
    t.string   "script_ids"
    t.integer  "company_id"
    t.string   "key_action"
    t.string   "name"
    t.string   "description"
    t.integer  "order"
    t.boolean  "deleted",     :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "alfa_scripts", ["company_id"], :name => "index_alfa_scripts_on_company_id"

  create_table "alfa_settings", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "alfa_settings", ["company_id"], :name => "index_alfa_settings_on_company_id"

  create_table "alfa_templates", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.boolean  "deleted",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "alfa_tokens", :force => true do |t|
    t.string   "token",      :null => false
    t.date     "expires_at", :null => false
    t.integer  "user_id"
    t.text     "rules"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "alfa_tokens", ["user_id"], :name => "index_alfa_tokens_on_user_id"

  create_table "alfa_users", :force => true do |t|
    t.integer  "company_id",                         :null => false
    t.string   "name"
    t.string   "email",                              :null => false
    t.string   "password",                           :null => false
    t.boolean  "blocked",         :default => false, :null => false
    t.boolean  "change_password", :default => true
    t.date     "date_expiration"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "deleted",         :default => false
  end

  add_index "alfa_users", ["company_id"], :name => "index_alfa_users_on_company_id"
  add_index "alfa_users", ["email", "password"], :name => "unique_alfa_users_email_and_password", :unique => true

  create_table "alfa_worktables", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "rating"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "deleted",    :default => false
    t.string   "alias"
  end

  add_index "alfa_worktables", ["user_id"], :name => "index_alfa_worktables_on_user_id"

end
