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

ActiveRecord::Schema.define(:version => 20111129193119) do

  create_table "contacts", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "jobtitle"
    t.string   "email"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "facebook"
    t.integer  "mainphone"
    t.integer  "workphone"
    t.integer  "faxnumber"
    t.string   "meetups"
    t.string   "meetup_url"
    t.text     "otherinfo"
    t.integer  "job_connection_id"
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.string   "jobtitle"
    t.string   "jobdescription"
    t.string   "postinglink"
    t.datetime "dateofposting"
    t.integer  "salary"
    t.string   "careerfield"
    t.datetime "dateappliedto"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "job_connection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
