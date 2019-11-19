# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'



10.times do
  adult_space = rand(5),
  child_space = rand(2),
  infant_space = rand(1),
  room = Room.new(
    address: Faker::Address.street_address,
    adult_space: adult_space,
    child_space: child_space,
    infant_space: infant_space,
    beds: :adult_space + :child_space,
    max_stay_length: rand(5),

   )
 room.save!
end

# INSTALL FAKER GEM IN GEM FILE
    # t.string "address"
    # t.integer "adult_space"
    # t.integer "child_space"
    # t.integer "infant_space"
    # t.integer "beds"
    # t.integer "max_stay_length"
    # t.string "availability"
    # t.bigint "user_id"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    # t.string "image_url"
    # t.string "title"
    # t.index ["user_id"], name: "index_rooms_on_user_id"
