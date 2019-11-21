require 'faker'
Room.destroy_all
User.destroy_all

# Variables Defined

flats_images = ["https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat1.jpg",
"https://ii1.pepperfry.com/media/catalog/product/s/w/494x544/swirl-single-bed-with-box-storage-in-denver-oak-finish-by-hometown-swirl-single-bed-with-box-storage-dtz9tx.jpg",
"https://images-na.ssl-images-amazon.com/images/I/81Chh4C6mML._SL1500_.jpg",
"https://www.cuckooland.com/dnc/cuckooland/artwork/product_images/Pino-White-Kids-Single-Bed.jpg?quality=95&scale=canvas&width=400&height=400",
"https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat5.jpg",
"https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat6.jpg",
"https://ksassets.timeincuk.net/wp/uploads/sites/56/2013/05/Blue-bedroom-ideas-1.jpg",
"https://www.noaandnani.co.uk/images/hampshire-single-bed-frame-in-white-p919-6359_image.jpg",
"https://media-cdn.tripadvisor.com/media/photo-s/10/76/7c/8f/bedroom-with-small-window.jpg",
"https://www.padsforstudents.co.uk/UserFiles/properties/229/746796b99e2ae3297a8e2fb7402ea520_1_l.jpg",
"https://www.theculpeper.com/wp-content/uploads/2016/03/DRM_Culp_Rooms_HR-24DRM_0573.jpg",
"https://images.trvl-media.com/hotels/27000000/26600000/26590900/26590840/0d4279dc_z.jpg",
"https://images.trvl-media.com/hotels/36000000/35870000/35867700/35867652/25aad79f_z.jpg"]

flats_titles = ["Double Room In London City", "Double Room In Old Street", "Single Room in Hoxton", "Double room in Shoreditch",
"Single Bed In Haggerston", "Single Bed In Hackeny", "Double Room in Whitechapel", "Single Bed in Kings Cross", "Single Room Stepney"]

address_london = ["Croydon", "Camden", "Balham", "Hackney", "Dulwich", "Old Street", "Slough",
"Chiswick", "Greenwich", "Catford", "Whitechapel", "Aldgate", "Liverpool Street"]


real_location_london = ["42 Ravenslea Rd, Balham, London SW12 8RX",
"12 Peckham Rye, London, SE15 3JD",
"51 Walnut Tree Rd, London SE10 9EU",
"1 Robert St, London, NW1 3JU",
"119 Rushmore Rd, Lower Clapton, London E5 0HA",
"46 Rushford Rd, London, SE4 1SG",
"19 Grove Park Gardens, London, W4 3RY",
"15 High Street Chalvey, Slough, SL1 2RU"]



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
i = 0
13.times do
  adult_space = rand(1..5)
  child_space = rand(2)
  infant_space = rand(1)

  room = Room.new(
    # address: address_london.sample,
    address: real_location_london.sample,
    adult_space: adult_space,
    child_space: child_space,
    infant_space: infant_space,
    beds: (adult_space + child_space + infant_space),
    max_stay_length: rand(5),
    image_url: flats_images[i],
    user: User.all.sample,
    title: flats_titles.sample,
    postcode: address_london.sample,
    facilities: ["Shared","Private"].sample
   )
 room.user = User.all.sample
 room.save!
 i += 1
end

puts "Creating Bookings"

10.times do
  booking = Booking.new(
    confirmed: [true, false].sample,
    host_control: [true, false].sample,
    number_of_adults: rand(1..3),
    number_of_children: rand(0..2),
    number_of_infants: rand(0..1),
    start_date: Faker::Date.forward(days: 2),
    end_date: Faker::Date.forward(days: 6))
  booking.user = User.all.sample
  booking.room = Room.all.sample
  booking.save!
end

puts "Creating host user 'Paula' with email: 'host@icarebnb.com' and password: '123456'"

test_user = User.create(
    email: "host@icarebnb.com",
    title: ["Mr", "Mrs", "Miss"].sample,
    first_name: "Paula",
    surname: "Christa" ,
    address: "159 St. John Street, London, EC1V 4QJ",
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.backward(days: 400),
    gender: "Female",
    host: true,
    password: "123456",
    avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhiz0_0XhnXFWXEp_8OpHjoO4HfEh4B8B-hkodfu7Z2G_7u1Sr&s"
)

puts "Creating Charity Representative 'Leia' with email: 'charity@icarebnb.com' and password: '123456'"

test_user = User.create(
    email: "charity@icarebnb.com",
    title: "Miss",
    first_name: "Leia",
    surname: "Mantell" ,
    address: Faker::Address.street_address ,
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.backward(days: 400),
    gender: "Female" ,
    host: false,
    password: "123456",
    avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkovcVYkJI4zr3FkFjbROa8S7gkZ42FWLEaDxfIHPKBj8Xg_kg&s"
)

puts "Creating Test email: 'test@test.com' and password: '123456'"

test_user = User.create(
    email: "test@test.com",
    title: "Miss",
    first_name: "Leia",
    surname: "Mantell" ,
    address: Faker::Address.street_address ,
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.backward(days: 400),
    gender: "Female" ,
    host: false,
    password: "123456",
    avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkovcVYkJI4zr3FkFjbROa8S7gkZ42FWLEaDxfIHPKBj8Xg_kg&s"
)
