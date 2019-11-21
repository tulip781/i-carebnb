require 'faker'
Room.destroy_all
User.destroy_all
Booking.destroy_all

# Variables Defined

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

"https://images.trvl-media.com/hotels/36000000/35870000/35867700/35867652/25aad79f_z.jpg",
"https://media.jeromes.com/content/Image/levels/desktop/bedroom_featured-collections_full-beds.webp",
"https://lid.zoocdn.com/645/430/188ed11956e130eee60a1ea6d69894c796c91172.jpg",
"https://media-cdn.tripadvisor.com/media/photo-s/02/01/8d/2b/ibis-hotel-northampton.jpg",
"https://imganuncios.mitula.net/medium/2_bedroom_flat_for_sale_2400095566573537933.jpg",
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
"41 Crown St, Reading, RG1 2SN",
"46 Rushford Rd, London, SE4 1SG",
"19 Grove Park Gardens, London, W4 3RY",
"15 High Street Chalvey, Slough, SL1 2RU",
"101 Gordon St Northampton, NN2 6BW",
"41 Crown St, Reading, RG1 2SN",
"101 Gordon St Northampton, NN2 6BW",
"41 Crown St, Reading, RG1 2SN",
"46 Rushford Rd, London, SE4 1SG",
"19 Grove Park Gardens, London, W4 3RY",
"15 High Street Chalvey, Slough, SL1 2RU",
"101 Gordon St Northampton, NN2 6BW",
"41 Crown St, Reading, RG1 2SN"
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
you might need anything extra."]


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
17.times do
  adult_space = rand(1..2)
  child_space = rand(1)
  infant_space = 0

  room = Room.new(

    address: real_location[i],
    # address: real_location_london.sample,

    adult_space: adult_space,
    child_space: child_space,
    infant_space: infant_space,
    beds: (adult_space + child_space + infant_space),
    max_stay_length: rand(5),
    image_url: flats_images[i],
    description: descriptions.sample,
    user: User.all.sample,
    title: flats_titles.sample,

    postcode: address_london[i],

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
