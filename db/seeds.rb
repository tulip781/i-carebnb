# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Room.destroy_all

User.destroy_all
user1 = User.create

flats_images = ["https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat1.jpg",
"https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat2.jpg",
"https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat3.jpg",
"https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat4.jpg",
"https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat5.jpg",
"https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat6.jpg",
"https://ksassets.timeincuk.net/wp/uploads/sites/56/2013/05/Blue-bedroom-ideas-1.jpg",
"https://www.noaandnani.co.uk/images/hampshire-single-bed-frame-in-white-p919-6359_image.jpg"]

10.times do
end



# create_table "users", force: :cascade do |t|
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "title"
#     t.string "first_name"
#     t.string "surname"
#     t.text "address"
#     t.text "phone_number"
#     t.date "date_of_birth"
#     t.text "gender"
#     t.boolean "host"
#     t.date "start_date"
#     t.date "end_date"
#     t.index ["email"], name: "index_users_on_email", unique: true
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#   end





10.times do
  adult_space = rand(5)
  child_space = rand(2)
  infant_space = rand(1)
  room = Room.new(
    address: Faker::Address.street_address,
    adult_space: adult_space,
    child_space: child_space,
    infant_space: infant_space,
    beds: (adult_space + child_space + infant_space),
    max_stay_length: rand(5),
    image_url: flats_images[rand(8)],
    availability: [true, false].sample,
    user: User.all.sample
   )
 room.save!
end

  # create_table "rooms", force: :cascade do |t|
  #   t.string "address"
  #   t.integer "adult_space"
  #   t.integer "child_space"
  #   t.integer "infant_space"
  #   t.integer "beds"
  #   t.integer "max_stay_length"
  #   t.bigint "user_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.string "image_url"
  #   t.string "title"
  #   t.boolean "availability", default: true
  #   t.index ["user_id"], name: "index_rooms_on_user_id"
