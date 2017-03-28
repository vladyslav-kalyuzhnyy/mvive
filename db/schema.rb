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

ActiveRecord::Schema.define(version: 20170328084633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beauty_novunkus", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "beauty_novunkus", ["slug"], name: "index_beauty_novunkus_on_slug", unique: true, using: :btree

  create_table "beauty_trends", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "beauty_trends", ["slug"], name: "index_beauty_trends_on_slug", unique: true, using: :btree

  create_table "blog_khrystyna_kolyadas", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.text     "body7"
    t.text     "body8"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.string   "image7"
    t.string   "image8"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "blog_khrystyna_kolyadas", ["slug"], name: "index_blog_khrystyna_kolyadas_on_slug", unique: true, using: :btree

  create_table "blogs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.text     "body7"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.string   "image7"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "blogs", ["slug"], name: "index_blogs_on_slug", unique: true, using: :btree

  create_table "castings", force: :cascade do |t|
    t.integer  "rating"
    t.string   "subject"
    t.string   "price"
    t.string   "tag1"
    t.string   "tag2"
    t.string   "tag3"
    t.string   "country_code"
    t.string   "city"
    t.text     "task"
    t.string   "license"
    t.string   "selected",     default: ""
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "casting_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "designer_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "experience"
    t.string   "specialization"
    t.string   "work_place"
    t.string   "events"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "events_day"
    t.string   "events_month"
    t.string   "events_adress"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "image5"
    t.string   "image6"
    t.string   "image7"
    t.string   "image8"
    t.string   "image9"
    t.string   "image10"
    t.string   "image11"
    t.string   "image12"
    t.string   "image13"
    t.string   "image14"
    t.string   "image15"
    t.string   "image16"
    t.string   "image17"
    t.string   "image18"
    t.string   "image19"
    t.string   "image20"
    t.string   "image21"
    t.string   "image22"
    t.string   "image23"
    t.string   "image24"
    t.string   "image25"
    t.string   "image26"
    t.string   "image27"
    t.string   "image28"
    t.string   "image29"
    t.string   "image30"
    t.string   "image31"
    t.string   "image32"
    t.string   "image33"
    t.string   "image34"
    t.string   "image35"
    t.string   "image36"
    t.string   "image37"
    t.string   "image38"
    t.string   "image39"
    t.string   "image40"
    t.string   "image41"
    t.string   "image42"
    t.string   "image43"
    t.string   "image44"
    t.string   "image45"
    t.string   "image46"
    t.string   "image47"
    t.string   "image48"
    t.string   "image49"
    t.string   "image50"
  end

  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree

  create_table "exclusives", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.text     "body7"
    t.text     "body8"
    t.text     "body9"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.string   "image7"
    t.string   "image8"
    t.string   "image9"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "exclusives", ["slug"], name: "index_exclusives_on_slug", unique: true, using: :btree

  create_table "fashionandmakeups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "address"
    t.string   "phone"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fashionshows", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "image7"
    t.string   "image8"
    t.string   "image9"
    t.string   "image10"
    t.string   "image11"
    t.string   "image12"
    t.string   "image13"
    t.string   "image14"
    t.string   "image15"
  end

  add_index "fashionshows", ["slug"], name: "index_fashionshows_on_slug", unique: true, using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "rating"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "krasota_ta_zdorovjas", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "krasota_ta_zdorovjas", ["slug"], name: "index_krasota_ta_zdorovjas_on_slug", unique: true, using: :btree

  create_table "kulturas", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "kulturas", ["slug"], name: "index_kulturas_on_slug", unique: true, using: :btree

  create_table "lifestyles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "lifestyles", ["slug"], name: "index_lifestyles_on_slug", unique: true, using: :btree

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "men_fashions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "men_fashions", ["slug"], name: "index_men_fashions_on_slug", unique: true, using: :btree

  create_table "modas", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "modas", ["slug"], name: "index_modas_on_slug", unique: true, using: :btree

  create_table "model_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "work_place"
    t.string   "experience"
    t.string   "specializationt"
    t.string   "specialization"
    t.string   "events"
    t.string   "license"
    t.string   "haircolor"
    t.string   "hairsize"
    t.string   "face"
    t.string   "eyes"
    t.integer  "boobs"
    t.integer  "waist"
    t.integer  "hip"
    t.integer  "height"
    t.integer  "mass"
    t.string   "clothes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mvive_tvs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.string   "image"
    t.string   "video"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "mvive_tvs", ["slug"], name: "index_mvive_tvs_on_slug", unique: true, using: :btree

  create_table "news", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "body5"
    t.string   "body6"
    t.string   "body7"
    t.string   "body8"
    t.string   "body9"
    t.string   "body10"
    t.string   "image5"
    t.string   "image6"
    t.string   "image7"
    t.string   "image8"
    t.string   "image9"
    t.string   "image10"
  end

  add_index "news", ["slug"], name: "index_news_on_slug", unique: true, using: :btree

  create_table "peopleandparties", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.string   "image7"
    t.string   "image8"
    t.string   "image9"
    t.string   "image10"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "image11"
    t.string   "image12"
    t.string   "image13"
    t.string   "image14"
    t.string   "image15"
    t.string   "image16"
    t.string   "image17"
    t.string   "image18"
    t.string   "image19"
    t.string   "image20"
    t.string   "image21"
    t.string   "image22"
    t.string   "image23"
    t.string   "image24"
    t.string   "image25"
    t.string   "image26"
    t.string   "image27"
    t.string   "image28"
    t.string   "image29"
    t.string   "image30"
    t.string   "image31"
    t.string   "image32"
    t.string   "image33"
    t.string   "image34"
    t.string   "image35"
  end

  add_index "peopleandparties", ["slug"], name: "index_peopleandparties_on_slug", unique: true, using: :btree

  create_table "photographer_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "experience"
    t.string   "specialization"
    t.string   "license"
    t.string   "work_place"
    t.string   "camera"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "shoppingandmakeups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "address"
    t.string   "phone"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "addressinside"
    t.string   "working"
    t.string   "phoneinside"
    t.string   "slug"
  end

  add_index "shoppingandmakeups", ["slug"], name: "index_shoppingandmakeups_on_slug", unique: true, using: :btree

  create_table "stylist_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "experience"
    t.string   "specialization"
    t.string   "work_place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travels", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "travels", ["slug"], name: "index_travels_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "surname"
    t.string   "login"
    t.string   "type"
    t.string   "avatar"
    t.string   "cover"
    t.string   "country_code"
    t.string   "city"
    t.text     "about"
    t.string   "sex"
    t.date     "birthday"
    t.integer  "price"
    t.integer  "rating"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "woman_fashions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short"
    t.string   "news_day"
    t.string   "news_month"
    t.text     "body"
    t.text     "body2"
    t.text     "body3"
    t.text     "body4"
    t.text     "body5"
    t.text     "body6"
    t.string   "image"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "woman_fashions", ["slug"], name: "index_woman_fashions_on_slug", unique: true, using: :btree

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
