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

puts "creating users"
10.times do
  user = User.create(
    email: Faker::Internet.free_email,
    title: ["Mr", "Mrs", "Miss"].sample,
    first_name: Faker::Name.first_name,
    surname: Faker::Name.last_name ,
    address: Faker::Address.street_address ,
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.backward(days: 400),
    gender: ["Male", "Female"].sample ,
    host: [true, false].sample,
    )
end
puts "creating "
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

