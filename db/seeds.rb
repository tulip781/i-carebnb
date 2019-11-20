# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'pry'

Room.destroy_all

User.destroy_all

flats_images = ["https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat1.jpg",
"https://ii1.pepperfry.com/media/catalog/product/s/w/494x544/swirl-single-bed-with-box-storage-in-denver-oak-finish-by-hometown-swirl-single-bed-with-box-storage-dtz9tx.jpg",
"https://images-na.ssl-images-amazon.com/images/I/81Chh4C6mML._SL1500_.jpg",
"https://www.cuckooland.com/dnc/cuckooland/artwork/product_images/Pino-White-Kids-Single-Bed.jpg?quality=95&scale=canvas&width=400&height=400",
"https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat5.jpg",
"https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat6.jpg",
"https://ksassets.timeincuk.net/wp/uploads/sites/56/2013/05/Blue-bedroom-ideas-1.jpg",
"https://www.noaandnani.co.uk/images/hampshire-single-bed-frame-in-white-p919-6359_image.jpg"]

flats_titles = ["Double Room In London City", "Double Room In Old Street", "Single Room in Hoxton", "Double room in Shoreditch",
"Single Bed In Haggerston", "Single Bed In Hackeny", "Double Room in Whitechapel", "Single Bed in Kings Cross", "Single Room Stepney"]

address_london = ["Croydon", "Camden", "Lewisham", "Hackney", "Haggerston", "Old Street", "Hackney Wick",
"Shoreditch", "Kings Cross", "Paddington", "Whitechapel", "Aldgate", "Liverpool Street"]

puts "creating users ;)"
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
    password: "123456"
    )
end
puts "creating rooms ;)"

10.times do
  adult_space = rand(5)
  child_space = rand(2)
  infant_space = rand(1)
  room = Room.new(
    address: address_london.sample,
    adult_space: adult_space,
    child_space: child_space,
    infant_space: infant_space,
    beds: (adult_space + child_space + infant_space),
    max_stay_length: rand(5),
    image_url: flats_images[rand(8)],
    user: User.all.sample,
    title: flats_titles.sample,
    postcode: "LS63AG",
    facilities: ["Shared","Private"].sample,
   )
 room.save!
end

puts "Creating test user with email: 'test' and password: '123456'"

test_user = User.create(
    email: "test@test.com",
    title: ["Mr", "Mrs", "Miss"].sample,
    first_name: "Test",
    surname: "Test" ,
    address: Faker::Address.street_address ,
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.backward(days: 400),
    gender: ["Male", "Female"].sample ,
    host: [true, false].sample,
    password: "123456"
)

