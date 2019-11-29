require 'faker'
Room.destroy_all
User.destroy_all
Booking.destroy_all
Resident.destroy_all
Charity.destroy_all
CharitySupport.destroy_all
Guest.destroy_all
Safeguarding.destroy_all
puts "💥Destroying Old Database💥"
puts "🚀"
puts "🚀🚀"
puts "🚀🚀🚀"

flats_images = ["https://a0.muscache.com/im/pictures/24bace61-7ed2-4dec-8574-978f6e581e81.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/dac4c061-2de8-48f6-98db-e5d6959828ed.jpg?aki_policy=xx_large",
"https://a0.muscache.com/im/pictures/0e876759-fb04-40ec-aaf1-6900b46cfb02.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/50196810/0ba10ad4_original.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/c3be634f-b568-47ad-a0d5-bb2362ea7627.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/cf2e893a-5bcb-4bcf-9a94-1fdbbe43fef2.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/b6c585dd-b809-4530-80fc-341061fce378.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/f5a41e43-4ad1-4213-ad28-58c96a3181d4.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/2bdfd4b1-ce5f-40fb-9836-8ae004997980.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/2d329037-c547-4d3f-a7a8-504dde5da06e.jpg?aki_policy=xx_large",
"https://a0.muscache.com/im/pictures/b8873145-d46d-4ab3-9c72-707721355e75.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/5f5b7c19-9c8b-45f3-81a1-c86338b1093d.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/5eb43720-f7ab-4aeb-9809-8251ba31ed38.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/27187347-9681-40ba-8eb4-440f26a2ab01.jpg?aki_policy=xx_large",
"https://a0.muscache.com/im/pictures/ceb026b3-f13f-46d5-bf7c-b55c4ec3d4e7.jpg?aki_policy=xx_large",
"https://a0.muscache.com/im/pictures/ea6d95b8-2d33-4c09-be6c-c1032783f68e.jpg?aki_policy=xx_large",
"https://a0.muscache.com/im/pictures/25d4f0b4-38fa-4902-8f68-42bf3620e915.jpg?aki_policy=xx_large",
"https://a0.muscache.com/im/pictures/75416643/ec3bf2d9_original.jpg?aki_policy=xx_large",
"https://a0.muscache.com/im/pictures/93553720-9560-4d36-84e2-e7a017323f60.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/2e9f4f65-ce86-4ee5-accd-326648223b20.jpg?aki_policy=x_large",
"https://a0.muscache.com/im/pictures/1903b8d8-48e4-42da-a4cb-e7f130657633.jpg?aki_policy=x_large"
]

flats_titles = ["Double Room In London City", "Double Room In Old Street", "Single Room in Hoxton", "Double room in Shoreditch",
"Single Bed In Haggerston", "Single Bed In Hackeny", "Double Room in Whitechapel", "Single Bed in Kings Cross", "Single Room Stepney"]

address_london = ["Croydon", "Camden", "Balham", "Hackney", "Dulwich", "Old Street", "Slough",
"Chiswick", "Greenwich", "Catford", "Whitechapel", "Aldgate", "Liverpool Street", "Northampton",
"Reading", "Camden", "Balham", "Hackney", "Dulwich", "Old Street", "Slough",
"Chiswick", "Greenwich", "Catford", "Whitechapel", "Aldgate", "Liverpool Street", "Northampton",
"Reading"]

real_location = ["42 Ravenslea Rd, Balham, London, SW12 8RX",
"12 Peckham Rye, London, SE15 3JD",
"51 Walnut Tree Rd, London, SE10 9EU",
"1 Robert St, London, NW1 3JU",
"119 Rushmore Rd, Lower Clapton, London, E5 0HA",
"46 Rushford Rd, London, SE4 1SG",
"19 Grove Park Gardens, London, W4 3RY",
"15 High Street Chalvey, Slough, SL1 2RU",
"101 Gordon St Northampton, NN2 6BW",
"20 Cumin Pl Edinburgh EH9 2JX",
"10 Downing Street, London, SW1A 2AA",
"41 Crown St, Reading, RG1 2SN",
"149 Cardigan Rd, Leeds, LS6 1LJ",
"Victoria St Bristol BS1 6AH",
"50 Stoke Rd Plymouth PL1 5JG",
"55 Kinson Rd Bournemouth BH10 4AH",
"419 Claremont Rd Manchester M14 5XF",
"Broad Ln Sheffield S3 7HQ",
"Milestone Ln Birmingham B21 0LA",
"7 Madingley Rd Cambridge CB3 0EE"
]

descriptions = ["Double room in period flat.
2 minutes from East Finchley tube which is less than 30 minutes from the City and West End.
And only 2 minutes walk to the High Street which has an independent cinema, nice pubs, restaurants and coffee
shops as well as all the usual amenities.", "A very large room with a huge wardrobe. Free wifi and a fridge inside
the room. A shared living room with transport access very close by.", "Modern, comfortable room with a double bed,
specious wardrobe, bedside table and luxurious decor with a lock for safety and privacy.
High speed internet. Separate private bathroom with a bathtub.", "Situated in Ladywell this room enables you to have
both privacy and convince - being only 12 minutes away by train to London Bridge. The short train ride to
London Bridge,Waterloo and shortly stopping at Charing Cross which will enable you to roam around Covent
Garden and cross the river to Southbank or even venture further by bus or the underground to Oxford Street,
Regent Street and all other destinations. Whether you have a short or long stay in London - my place is perfect.",
"Accomodation for one guest in this charming, quiet, single bedroom in 18th century property. Wonderfully located
to experience the cultural diversity within walking distance of my front door in the vibrant central London area of
Soho. Within walking distatnce of all shops, parks, theatres, restaurants and museums of central London. 5 minutes
walk to Piccadilly Circus, 10 minutes walk to Oxford Street, 20 mins walk to Buckinham Palace and 5 minutes walk to
Chinatown.", "Great double room in a lovely Victorian house right infront Victoria park. Great location to get around,
 bus 1 min from house takes to to Liverpool Street, etc. Surrounded my loads of great cafe, restaurants, art galleries,
 the gym is just 3 mins away, hospital 10mins walk, can walk to Westfield shopping centre, only 20mins walk.
 We are in the heart of Victoria park lovely canal right in park. The house clean daily, very quiet, and welcoming to
 anyone who visit. Treat everyone with respect.", "This amazing room is in the centre of many stations 10 minutes walk
 from St John’s wood,12 minutes walk from Warwick Avenue, 12 minutes walk from Marylebone,12 minutes walk from Edward Road.
 Several buses stops nearby, a few minutes away is the Tesco and a restaurants and social areas, close to Lord's Cricket Ground.
 Perfect equally for a holiday or a business traveller. Fantastic location.", "Located in Brixton, the house is
 a walking distance of 10 minutes from brixton station. A vivacious, cultural and creative location with
 lots of lovely restaurants, bars, pubs, cinemas and markets. The room is in a three bedroomed house and
 is spacious, clean, airy with fun and kind housemates.", "Located between Angel station and
 Stoke Newington. 2 mins to Canonbury tube station. It is the right place for any age, from families to young fellas. Great restaurants, markets and connection to the city
centre! The whole flat is at your service, newly renovated with a sofabed in the
livingroom and a large kitchen suitable for dinners. You can write me anytime if
you might need anything extra.", "Location is everything with this home (located M3 - Central,
8 min from Arena, 10minutes to Northern Quarter, 15min tram ride away from football
stadiums), a nice one bedroom flat with a comfortable double bed, my lounge is open plan
 and overlooks Manchester - the flat sleeps 2 people easily, and the living room can accommodate up
 to one extra guests staying on pop up beds (extra charge done via airbnb ) , an affordable, central
  home for you to see Manchester from :)", "This en-suite apartment consists of one room and bathroom.
  In the room there is a large double bed (real, sprung mattress) on one side and a small kitchen on the other.
  There is a double wardrobe, a table and chair, and an armchair. In the bathroom there is a shower
  (but no bathtub). We provide towels, basic toiletries and a hairdryer, so you don't need to bring yours.
The kitchen has a small fridge with a freezer, a microwave-oven, 2 hotplates, toaster, electric kettle so
you can cook small meals or warm up any take-aways. We provide tea, milk, and breakfast cereals.",
"Get a true coastal experience from this minimalist-inspired apartment highlighted with natural
woods and charming sea-themed decor. With an open-plan living space, sea views, and skylight-lit
rooms, it provides a comfortable and peaceful ambiance."
]

puts "👫 creating users 👫"

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

puts "👵 Creating host user 'Paula' with email: 'host@icarebnb.com' and password: '123456' 👵"

test_user1 = User.create(
    email: "host@icarebnb.com",
    title: ["Mr", "Mrs", "Miss"].sample,
    first_name: "Paula",
    surname: "Smith" ,
    address: "159 St. John Street, London, EC1V 4QJ",
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.backward(days: 400),
    gender: "Female",
    host: true,
    password: "123456",
    avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhiz0_0XhnXFWXEp_8OpHjoO4HfEh4B8B-hkodfu7Z2G_7u1Sr&s"
)

puts "🙆‍♀️ Creating Charity Representative 'Leia' with email: 'charity@icarebnb.com' and password: '123456' 🙆‍♀️"

test_user2 = User.create(
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

puts "🕺 Creating Test email: 'test@test.com' and password: '123456' 🕺"

test_user3 = User.create(
    email: "test@test.com",
    title: "Miss",
    first_name: "Leia",
    surname: "Allen" ,
    address: Faker::Address.street_address ,
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.backward(days: 400),
    gender: "Female" ,
    host: false,
    password: "123456",
    avatar_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkovcVYkJI4zr3FkFjbROa8S7gkZ42FWLEaDxfIHPKBj8Xg_kg&s"
)

puts '♥️ Creating Charity with name = Shelter ♥️'

charity_one = Charity.create(
  charity_number: '202020',
  name: 'Shelter',
  address: '88 Old St, London EC1V 9HU',
  phone_number: '0300 330 1234',
  main_contact: 'Charity Main Contact')

puts '♥️♥️ Creating Charity with name = Mencap ♥️♥️'

charity_two = Charity.create(
  charity_number: '101010',
  name: 'Mencap',
  address: '66 Commercial St, Spitalfields, London E1 6LT',
  phone_number: '0312 33231 1234',
  main_contact: 'Charity Main Contact 2')

puts '♥️♥️♥️ Creating Charity with name = Toynbee Hall ♥️♥️♥️'

charity_three = Charity.create(
  charity_number: '303030',
  name: 'Toynbee Hall',
  address: '66 Commercial St, Spitalfields, London E1 6LT',
  phone_number: '0312 33231 1234',
  main_contact: 'Charity Main Contact 3')

puts "🏠 creating rooms 🏠"

i = 0
20.times do
  adult_space = rand(1..2)
  child_space = rand(2)
  infant_space = rand(2)

  room = Room.new(
    address: real_location[i],
    adult_space: adult_space,
    child_space: child_space,
    infant_space: infant_space,
    beds: (adult_space + child_space + infant_space),
    max_stay_length: rand(30),
    # image_url: flats_images[i],
    description: descriptions.sample,
    user: User.all.sample,
    title: flats_titles.sample,
    postcode: address_london[i],
    facilities: ["Shared","Private"].sample
  )
  file = URI.open(flats_images[i])
  room.photo.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')

 room.user = User.all.sample
 room.save!
 i += 1
end

sleep(0.5)

puts "👩‍🦰 Assiging Room to the Host, Paula 👩‍🦰"

room = Room.all.sample
room.user = test_user1
room.save!
room2 = Room.all.sample
room2.user = test_user1
room2.save!

sleep(0.5)

puts '🌟Creating a Guest called Dummy Guest for Details to be provided later - assigned to Charity Mencap🌟'

dummy_guest = Guest.new(
  first_name: "Details to be provided later",
  child_space: 0,
  adult_space: 1)
dummy_guest.charity = charity_two
dummy_guest.save


harry = Guest.new(
  first_name: "Harry",
  child_space: 2,
  adult_space: 1)
harry.charity = charity_two
harry.save!

sleep(0.5)

puts '🌟Creating a Guest called Tarry - assigned to Charity Mencap🌟'

tarry = Guest.new(
  first_name: "Tarry",
  child_space: 2,
  adult_space: 1)
tarry.charity = charity_two
tarry.save!

sleep(0.5)

puts '🌟🌟Creating a Guest called Tash - assigned to Charity Shelter🌟🌟'

tash = Guest.new(
  first_name: "Tash",
  child_space: 2,
  adult_space: 1)
tash.charity = charity_one
tash.save!

sleep(0.5)


puts "📆 Creating Bookings 📆"

10.times do
  booking = Booking.new(
    confirmed: [true, false].sample,
    host_control: [true, false].sample,
    number_of_adults: rand(1..3),
    number_of_children: rand(0..2),
    number_of_infants: rand(0..2),
    start_date: Faker::Date.forward(days: 2),
    end_date: Faker::Date.forward(days: 6))
  booking.user = User.all.sample
  booking.room = Room.all.sample
  booking.guest = Guest.all.sample
  booking.save!
end

sleep(0.5)

puts '🗃 Creating Pending Booking and Confirmed Booking For Paula 🗃'

booking1 = Booking.new
booking1.room = room
booking1.user = test_user2
booking1.guest = harry
booking1.save!
booking2 = Booking.new
booking2.room = Room.all.sample
booking2.user = test_user2
booking2.confirmed = true
booking2.guest = tarry
booking2.save!
booking3 = Booking.new
booking3.room = room2
booking3.user = test_user2
booking3.confirmed = true
booking3.guest = tash
booking3.save!

sleep(0.5)

puts '🌱 Starting Marco Seeds 🌱'

sleep(0.5)

puts '👨‍👩‍👧‍👦 Creating Residents 👨‍👩‍👧‍👦'

sleep(0.5)

puts '👨‍👨‍👧 Creating Resident One 👨‍👨‍👧'

sleep(0.5)

test_resident = Resident.new(
  first_name: "I am a test resident First Name",
  last_name: "This is a Resident Last Name",
  address: Faker::Address.street_address,
  date_of_birth: Faker::Date.backward(days: 400),
  gender: "Female",
  safeguarding_check?: true)
test_resident.room = room
test_resident.save!

puts '👨‍👨‍👧‍👦 Creating Resident Two 👨‍👨‍👧‍👦'

sleep(0.5)

test_resident2 = Resident.new(
  first_name: "I am a 2nd test resident First Name",
  last_name: "This is a 2nd Resident Last Name",
  address: Faker::Address.street_address,
  date_of_birth: Faker::Date.backward(days: 400),
  gender: "Male",
  safeguarding_check?: true)
test_resident2.room = room
test_resident2.save!

puts '👨‍👦 Creating Safeguarding 👨‍👦 1'

sleep(0.5)

safe_guard = Safeguarding.new(
  approved: true)
safe_guard.user = test_user1
safe_guard.resident = test_resident
safe_guard.save!


puts '👩‍👩‍👦‍👦 Creating Safeguarding 👩‍👩‍👦‍👦 2'

sleep(0.5)

safe_guard2 = Safeguarding.new(
  approved: true)
safe_guard2.user = test_user1
safe_guard2.resident = test_resident2
safe_guard2.save!

puts '🌺 Creating Charity Supports (Charity + User Joining Table) - Assiging Host Paula to
Charity Shelter with newsletter = true 🌺'

sleep(0.5)

charity_support1 = CharitySupport.new(
  newsletter: true)
charity_support1.user = test_user1
charity_support1.charity = charity_one
charity_support1.save!

puts '🌺 Creating Charity Supports (Charity + User Joining Table) - Assiging Representative Leia to
Charity Mencap with newsletter = true 🌺'

sleep(0.5)

charity_support2 = CharitySupport.new(
  newsletter: true)
charity_support2.user = test_user2
charity_support2.charity = charity_two
charity_support2.save!

sleep(0.5)

puts 'D👽NE'







