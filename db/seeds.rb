require 'faker'

Room.destroy_all
User.destroy_all
Booking.destroy_all
Resident.destroy_all
Charity.destroy_all
CharitySupport.destroy_all
Guest.destroy_all

Safeguarding.destroy_all
puts '
  ___ ___   _   ___ ___ ___ _  _ ___
 |_ _/ __| /_\ | _ \ __| _ ) \| | _ )
  | | (__ / _ \|   / _|| _ \ .` | _ \
 |___\___/_/ \_\_|_\___|___/_|\_|___/
                                     '
puts "💥Destroying Old Database💥"
sleep(0.5)
puts "🚀"
sleep(0.4)
puts "🚀🚀"
sleep(0.3)
puts "🚀🚀🚀"
sleep(0.2)

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

real_location = [
"10 Downing Street, London, SW1A 2AA",

"1 Robert St, London, NW1 3JU",
"12 Peckham Rye, London, SE15 3JD",
"42 Ravenslea Rd, Balham, London, SW12 8RX",
"119 Rushmore Rd, Lower Clapton, London, E5 0HA",
"46 Rushford Rd, London, SE4 1SG",
"51 Walnut Tree Rd, London, SE10 9EU",
"19 Grove Park Gardens, London, W4 3RY",
"41 Crown St, Reading, RG1 2SN",
"7 Madingley Rd, Cambridge, CB3 0EE",
"101 Gordon St, Northampton, NN2 6BW",
"55 Kinson Rd, Bournemouth, BH10 4AH",
"Milestone Ln, Birmingham, B21 0LA",
"Victoria St, Bristol, BS1 6AH",
"Broad Ln, Sheffield, S3 7HQ",
"419 Claremont Rd, Manchester, M14 5XF",
"149 Cardigan Rd, Leeds, LS6 1LJ",
"50 Stoke Rd, Plymouth, PL1 5JG",
"20 Cumin Pl, Edinburgh EH9 2JX",
"15 High Street, Chalvey, Slough, SL1 2RU"
]

descriptions = ["10 Downing Street, the locale of British prime ministers since 1735, vies with the White House as being
the most important political building anywhere in the world in the modern era.
Behind its black door have been taken the most important decisions affecting
Britain for the last 275 years.  The latest decision may be the biggest one.
It has opened its doors to those most in need, whether that be the homeless,
long term carers, those fleeing wars and persecution.  The main host may soon be different,
but their commitment to icarebnb.org remains.", "In the middle of one of the wealthiest areas in London, this kind host has four
beds available in a cozy and safe environment.  Ideal for a family who doesn’t mind sharing a room.
The family was at one point in desperate need, and through the help of strangers, managed to get itself
back on its feet before setting up a local business which has flourished.  It now wants to provide the
sort of help they themselves received.  The host is happy to provide a hot evening meal and breakfast.
While the bathroom facilities are shared, they are large and two big hot water tanks mean that hot running
water shouldn’t be a problem.", "Round the corner from one of the most famous addresses on British television, this has nothing to
do with Del, Rodney and Uncle Arthur.  The host has a room with four beds (two bunk beds) available to help
those in need.  The eldest son is currently at university, and while efforts have been made to cleanse the
room of his aroma, there continues to be a lingering light ambience of sports socks.  Not too off-putting,
but you have been warned!  The hosts will make every effort to make the guests feel at home.",
"This is a pretty cozy room with a single bed.  Can only comfortably accommodate one person.  A view of a green garden in a
pretty calm and quiet environment.  A retired police officer would like to help someone get back
on their feet.  The accommodation is near Wandsworth Common so access to a large green space could
also be helpful to the guest.  Overground rail is nearby too if needed.  The guest room has recently
been decorated, so it wouldn’t be suitable for anyone sensitive to the smell of fresh paint.",
"Modern comfortable room with desk and high speed internet.  Location isn’t too far from Homerton Hospital which would help family
visit someone at that hospital if needed.  Close to the Hackney Marshes too.  Host is a retired actor with strong interest in helping
families seeking refuge from plight in own country.  Recent guest was someone being persecuted for their homosexuality and refused medical
help for a serious but treatable condition and particularly appreciated living with a host who has himself suffered homophobia.  Host also has
an interest in alleviating homelessness.  Private bathroom facilities, albeit small.", "Nice sized room with desk and wifi.
Close to a number of green spaces and also the local river.  Host has welcomed many guests seeking a
break from a lifetime of caring duties.  Host has had particular experience with people with learning
disabilities so is empathetic of the challenges around their care.  Host has also helped many people
with learning disabilities into work.  Guest is welcome to eat with the family when it eats.  Room at
the inn, and room at the table!", "Two rooms with two beds each available for one family.  Small terraced house.  Close to the River Thames.  Hosts (a spouse couple) used
to be City professionals before retirement.
Kids at university frees up two rooms to help people who need them.  Hosts have spent their lives trying to alleviate the homeless problem in London with volunteer work
and also corporate fundraising efforts for a number of homeless charities.  This has given them a keen understanding of the value of
helping people at the earliest stage of homeless risk and the challenges the local authorities face in finding suitable accommodation.",
"Located near the River Thames and not far from Chiswick House Grounds.  High street is a 15 minute walk but local shops nearby.  Very close to Chiswick overground station with route into Waterloo.  Hosts have done a lot of work helping refugees, including fundraising
and mentoring refugees bettering their futures through entrepreneurship.  Hosts speak Arabic.  Their safeguarding checks have been done to a detailed level because of their recent work with local schools.",
"Located near the River Kennet.  Near local shops.  About 15 minutes away from the town centre.  One of the hosts is a retired teacher and the other host is a retired lawyer.
Safeguarding checks have been kept up to date.  They have done a lot of work with children’s charities.
Room has come available with daughter having left home.  One host speaks fluent Spanish and the other host speaks fluent Hindi.
Hot meals will be available when the hosts eat.  Hosts live a very active lifestyle.",
"Two rooms available near St John’s College playing fields.  Host is a serving professor at the university.
Host has a particular interest in helping people with learning disabilities but would be happy to host refugees and people at risk of long term homelessness.
Kitchen facilities available for guests.  Host is a very bad cook and mainly lives on takeaway food.
If the guests can help with cooking, all the better!  A team effort to keeping the house tidy would be much appreciated.",
"Double bed.  Room overlooks green space.  Hosts are devout Christians and welcoming of people of all faiths and backgrounds.
Hosts have done considerable work with homeless shelters in the past.
One is a retired fire engineer and the other is an artist who continues to produce work.
If any of the guests want to pose for portraits, that would be an added bonus for the hosts,
but there is no pressure to do this.  Hosts are keen to help people get back on their feet.
After having suffered loss in their own lives, they have become very sensitive to the mental health
impacts of trauma on well being.",
"Two rooms.  About 10 minutes walk away from the seaside.  Hosts also have a labrador (gentle but big).  Dog lovers therefore particularly welcome.  Hosts care deeply about the worsening homeless problem in Bournemouth and so would like to provide emergency help to get those at risk back into a position where they can move forward.  Hosts work at the local council and so have been seeing first hand the difficulties the housing market is creating for vulnerable people.  Kitchen is available for guest to cook own meals.  Hosts culinary skills not a strong point.",
"Quite close to Birmingham City Hospital so particularly helpful location for carers visiting patients at the hospital.  Hosts have also accommodated refugees in the past and are also happy to help people at risk of homelessness.  Hosts speak Somali and English fluently and can also get by in Spanish and French.  Their children and the cats still live at home so anyone allergic to teenagers and cat hair are unlikely to be happy in this home.",
"Very large room available.  House is close to the River Avon.  Both hosts work at the local university.  Expertise in war studies has made them particularly sensitive to the ravages of war and the impact on families.  Support for guests escaping war torn countries is very welcome.  Hosts are also willing to support people at risk of homelessness and people involved in long-term care.  Kitchen available to guests who can cook, but we will have to work together so that it can work smoothly as hosts also cook.",
"Very close to the local university.  Hosts are concerned about the deteriorating homeless problem in Sheffield and volunteer at the local soup kitchen when they can.  Significant fundraising efforts have been undertaking in aid of local homeless charities.  Hosts are open to hearing about the help potential guests need to see what the hosts can do to help.  Accommodation is available.  As the hosts have a young child, the hosts will be very keen to understand the depth of the relationship between the guest and the relevant charity.",
"One room in the Rusholme area of Manchester.  Close to the Manchester University.  Green spaces close by.  Muslim host family particularly interested in helping Syrian refugees but Islam encourages charitable help to everyone in need and so the host family is open to helping people with all sorts of challenges.  Hosts would like to know more about the prospective guests in a detailed chat with the charity.  The hosts run a local Indian restaurant so if the guests like Indian food, the guests are in luck!",
"One room near Burley Park and not too far from the River Aire.  Mexican hosts speak fluent Spanish.  Hosts are both doctors at the local hospital with kids who have flown the nest.  The room has limited availability but the hosts are happy to help when they can.  Given the hosts’ background, carers are very welcome but so are homeless risk and refugees.  Safeguarding checks are limited but both are in a heavily regulated industry.  Hot meals can be arranged.",
"Very central location and also close to the coast.  Hosts have been close to the maritime industry all their lives and have also been involved in helping to alleviate human trafficking.  The hosts are open to anyone in need, subject to a detailed discussion with the relevant charity. The room is very large with a desk and also a sofa.  Very comfortable.  Hot meals can be arranged.  Please note that one of the hosts has a severe nut allergy so guests will need to avoid bringing nut products into the house.",
"Lovely room.  The host is a pastor at the local church.  Welcome to those from all backgrounds and all types of need.  The area is the Grange area of Edinburgh not too far from a number of green spaces.  Hot meals can be arranged.  If the guests are willing and available to help out at the pastor’s church, that would be fantastic but it is not necessary as part of the hosting arrangement.  The pastor is also a pretty handy cook, so if there are meal needs, prior notice would be appreciated so meals can be shared."
]

women_cloudinary = ['dan-ROJFuWCsfmA-unsplash_hnfv7s',
'cesar-abner-martinez-aguilar-MXnBNbOe64A-unsplash_xgry9z',
'sherise-H7fQpEfAKC8-unsplash_wnpbru',
'charles-postiaux-J9vlgGgytC0-unsplash_ztn521',
'jamie-brown-wm4DuvIpLj8-unsplash_bzgjwt']


men_cloudinary = ['jurica-koletic-7YVZYZeITc8-unsplash_s2zluj',
'marie-michele-bouchard-iel2tNw4WLM-unsplash_j4gnik',
'elizeu-dias-rlk6VkHZkns-unsplash_lremks',
'ashwini-chaudhary-eq6EJSdpHUQ-unsplash_wlepli',
'mason-hassoun-1Mhnd67sWqw-unsplash_gpl0un',
'hunter-johnson-OK7VpKfbb_c-unsplash_xptynt',
'norman-toth-lCVP-lu0kxk-unsplash_zcefrz',
'luis-quintero-zAv3h6EF5HE-unsplash_ro8ukw',
'sergio-de-paula-c_GmwfHBDzk-unsplash_hfjjrz',
'joseph-gonzalez-iFgRcqHznqg-unsplash_fbhxhx'
]


puts "👫 14 creating users (Hosts and Charity Reps) 👫"

sleep(0.5)

bot_user_array = []

5.times do
  gender_user = "Female"
  new_name = Faker::Name.female_first_name
  user = User.create(
    email: "#{new_name.downcase }@icarebnb.com",
    title: ["Mrs", "Miss"].sample,
    first_name: new_name,
    surname: Faker::Name.last_name ,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.backward(days: 400),
    gender: gender_user,
    host: [true, false].sample,
    password: "123456",
    avatar_url: women_cloudinary.pop
    )
end

10.times do
  gender_user = "Male"
  new_name = Faker::Name.male_first_name
  user = User.create(
    email: "#{new_name.downcase}@icarebnb.com",
    title: "Mr",
    first_name: new_name,
    surname: Faker::Name.last_name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.backward(days: 400),
    gender: gender_user,
    host: [true, false].sample,
    password: "123456",
    avatar_url: men_cloudinary.pop
    )
end

User.all.each {|user| bot_user_array << user }

sleep(0.5)

puts "👩‍⚖️ Creating Host 'Olivia' with email: 'host@icarebnb.com' and password: '123456' 👩‍⚖️"

olivia_host_user = User.create(
    email: "host@icarebnb.com",
    title: ["Mr", "Mrs", "Miss"].sample,
    first_name: "Olivia",
    surname: "Davis" ,
    address: "159 St. John Street, London, EC1V 4QJ",
    phone_number: '02077938301',
    date_of_birth: Faker::Date.backward(days: 400),
    gender: "Female",
    host: true,
    password: "123456",
    avatar_url: "juno-jo-nwdPxI1h4NQ-unsplash_rwvs9h"
)

puts "🙆‍♀️ Creating Charity-Rep 'Leia' with email: 'charity@icarebnb.com' and password: '123456' 🙆‍♀️"

sleep(0.5)

leia_charityrep_user = User.create(
    email: "charity@icarebnb.com",
    title: "Miss",
    first_name: "Leia",
    surname: "Williams" ,
    address: Faker::Address.street_address ,
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.backward(days: 400),
    gender: "Female" ,
    host: false,
    password: "123456",
    avatar_url: "kal-visuals-b1Hg7QI-zcc-unsplash_oclzjn"
)

puts "📐 Creating test account with email: 'test@test.com' and password: '123456' 📐"

sleep(0.5)

test_user3 = User.create(
    email: "test@test.com",
    title: "Mr",
    first_name: "Joseph",
    surname: "Wilson" ,
    address: Faker::Address.street_address ,
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.backward(days: 400),
    gender: "Male" ,
    host: false,
    password: "123456",
    avatar_url: "joseph-gonzalez-iFgRcqHznqg-unsplash_fbhxhx"
)

puts '♥️🏘️♥️ Creating Charity "Shelter"  ♥️🏘️♥️'

sleep(0.5)

charity_one = Charity.create(
  charity_number: '202020',
  name: 'Shelter',
  address: '88 Old St, London EC1V 9HU',
  phone_number: '0300 330 1234',
  main_contact: 'Charity Main Contact')

puts '♥️🧢♥️ Creating Charity "Mencap" ♥️🧢♥️'

sleep(0.5)

charity_two = Charity.create(
  charity_number: '101010',
  name: 'Mencap',
  address: '66 Commercial St, Spitalfields, London E1 6LT',
  phone_number: '0312 33231 1234',
  main_contact: 'Charity Main Contact 2')

puts '♥️⛪♥️ Creating Charity "Toynbee Hall" ♥️⛪♥️'

sleep(0.5)

charity_three = Charity.create(
  charity_number: '303030',
  name: 'Toynbee Hall',
  address: '66 Commercial St, Spitalfields, London E1 6LT',
  phone_number: '0312 33231 1234',
  main_contact: 'Charity Main Contact 3')

puts "🏠⏱ creating rooms - this can take 45 seconds ⏱🏠"

i = 0
20.times do
  adult_space = rand(1..2)
  child_space = [0,0,1,2].sample
  infant_space = 1

  room = Room.new(
    address: real_location[i],
    adult_space: adult_space,
    child_space: child_space,
    infant_space: infant_space,
    beds: (adult_space + child_space + infant_space),
    max_stay_length: rand(30),
    # image_url: flats_images[i],
    description: descriptions[i],
    user: bot_user_array.sample,
    title: flats_titles.sample,
    postcode: address_london[i],
    facilities: ["Shared","Private"].sample
  )
  file = URI.open(flats_images[i])
  room.photo.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')
  room.user = bot_user_array.sample
  room.save!
  i += 1
end

downing_street = Room.where(address: "10 Downing Street, London, SW1A 2AA").first
downing_street.adult_space = 1
downing_street.child_space = 1
downing_street.infant_space = 1

rooms_except_olivia = []
Room.all.each {|r| rooms_except_olivia << r }

shaftesbury = Room.new(
  address: "210 Shaftesbury Ave, London, WC2H 8DP",
  adult_space: 1,
  child_space: 1,
  infant_space: 1,
  beds: 3,
  max_stay_length: rand(30),
  # image_url: flats_images[i],
  description: "Downstairs some of the most famous actors in the world may be treading the boards of this famous theatre but a little known fact is that it has a small
flat hidden away in the back. Located in the middle of a district blighted by homelessness,
it has decided to make a difference.  It has made a generous and life changing decision to
welcome people in need from time to time to stay in its spare room.  The facilities are basic,
but everything a guest needs for a restful night is available.  The room has two beds, and has
access to clean bathroom facilities.  It has a power shower and clean towels.  A hot breakfast can
be arranged.",
  user: olivia_host_user,
  title: flats_titles.sample,
  postcode: address_london.sample,
  facilities: ["Shared","Private"].sample
)
file = URI.open(flats_images[i])
shaftesbury.photo.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')
shaftesbury.save!

sleep(0.5)

puts "🏠➡️👩‍⚖️ Assiging Room to the Host, Olivia 🏠➡️👩‍⚖️"

olivia_room_1 = Room.all[3]
olivia_room_1.user = olivia_host_user
olivia_room_1.adult_space = 1
olivia_room_1.child_space = 0
olivia_room_1.infant_space = 0
olivia_room_1.save!
olivia_room_2 = Room.all[5]
olivia_room_2.user = olivia_host_user
olivia_room_2.save!
olivia_room_3 = Room.all[0]
olivia_room_3.user = olivia_host_user
olivia_room_3.save!
olivia_room_5 = Room.all[6]
olivia_room_5.user = olivia_host_user
olivia_room_5.save!
olivia_room_4 = Room.where(address: "210 Shaftesbury Ave, London, WC2H 8DP").first
olivia_room_4.user = olivia_host_user
olivia_room_4.adult_space = 1
olivia_room_4.child_space = 1
olivia_room_4.infant_space = 1
olivia_room_4.save!

sleep(0.5)


puts '👴➡️🌟Creating a Guest called with first_name "Details to be provided later" - assigned to Charity Mencap👴➡️🌟'


dummy_guest2 = Guest.new(
  first_name: "Ben Barton",
  child_space: 0,
  adult_space: 1)
dummy_guest2.charity = charity_two
dummy_guest2.save


dummy_guest3 = Guest.new(
  first_name: "Rob Pickard",
  child_space: 0,
  adult_space: 1)
dummy_guest3.charity = charity_two
dummy_guest3.save

dummy_guest4 = Guest.new(
  first_name: "Ross Bickmore",
  child_space: 0,
  adult_space: 1)
dummy_guest4.charity = charity_two
dummy_guest4.save
sleep(0.5)


puts "📆 Creating 10 Random Bookings 📆"

10.times do
  booking = Booking.new(
    confirmed: [true, false].sample,
    host_control: [true, false].sample,
    number_of_adults: rand(1..3),
    number_of_children: [0,0,1].sample,
    number_of_infants: [0,0,1].sample,
    start_date: Faker::Date.forward(days: rand(50)),
    end_date: Faker::Date.forward(days: rand(50)))
  booking.user = bot_user_array.sample
  booking.room = rooms_except_olivia.sample
  booking.guest = Guest.all.sample
  booking.save!
end

sleep(0.5)

puts '📆 Creating Pending Booking 🧡, Confirmed Booking 💚, Declined Booking 💔 For Charity Rep Lei 🙆‍♀️📆'

booking1 = Booking.new
booking1.room = olivia_room_1
booking1.user = leia_charityrep_user
booking1.guest = charity_two.guests.first
booking1.start_date = Faker::Date.forward(days: 3)
booking1.end_date = Faker::Date.forward(days: 7)
booking1.number_of_adults = rand(1..2)
booking1.number_of_children = rand(0..2)
booking1.declined = true
booking1.save!

booking2 = Booking.new
booking2.room = olivia_room_5
booking2.user = leia_charityrep_user
booking2.confirmed = true
booking2.guest = dummy_guest2
booking2.start_date = Faker::Date.forward(days: 2)
booking2.end_date = Faker::Date.forward(days: 17)
booking2.number_of_children = rand(0..2)
booking2.number_of_adults = rand(1..2)
booking2.number_of_infants = rand(0..2)
booking2.save!
booking3 = Booking.new
booking3.room = olivia_room_2
booking3.user = leia_charityrep_user
booking3.confirmed = false
booking3.guest = dummy_guest3
booking3.start_date = Faker::Date.forward(days: 4)
booking3.end_date = Faker::Date.forward(days: 15)
booking3.number_of_children = rand(0..2)
booking3.number_of_adults = rand(1..2)
booking3.number_of_infants = rand(0..2)
booking3.save!
booking4 = Booking.new
booking4.room = olivia_room_3
booking4.user = leia_charityrep_user
booking4.guest = dummy_guest4
booking4.start_date = Faker::Date.forward(days: 4)
booking4.end_date = Faker::Date.forward(days: 7)
booking4.number_of_children = rand(0..2)
booking4.number_of_adults = rand(1..2)
booking4.number_of_infants = rand(0..2)
booking4.save!

sleep(0.5)


puts '👨‍👩‍👧‍👦 Creating Residents For Every Room of Olivia 👨‍👩‍👧‍👦'
puts 'Creating Safegaurdings for all these rooms through Olivia'

sleep(0.5)

room = olivia_host_user.rooms.first

olivia_host_user.rooms.each do |room|

test_resident = Resident.new(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  address: olivia_host_user.address,
  date_of_birth: Faker::Date.backward(days: rand(400)),
  gender: "Female",
  safeguarding_check?: true)
# olivia_host_user.rooms.each do {|r| test_resident.room = r  }
test_resident.room = room
safe_guard = Safeguarding.new(
  approved: true)
safe_guard.user = olivia_host_user
safe_guard.resident = test_resident
test_resident.save!
safe_guard.save!
end

rooms_except_olivia.each do |room|

test_resident2 = Resident.new(
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  address: olivia_host_user.address,
  date_of_birth: Faker::Date.backward(days: rand(400)),
  gender: "Male",
  safeguarding_check?: true)
test_resident2.room = room

safe_guard2 = Safeguarding.new(
  approved: true)
safe_guard2.user = bot_user_array.sample
safe_guard2.resident = test_resident2
test_resident2.save!
safe_guard2.save!
end


puts ' 🌆👨‍👦‍👦🌆 Assinging all users to a charity (through a Charity Support) 🌆👨‍👦‍👦🌆'

users_array = User.all
new_users = users_array.reject { |user| user.first_name == "Leia" }

new_users.each do |u|
  support = CharitySupport.new(
  newsletter: true)
  support.user = u
  support.charity = Charity.all.sample
  support.save!
end


sleep(0.5)

puts '👩‍⚖️➡️🏘️💌 Assiging Host Paula to
Charity Shelter with newsletter = true 👩‍⚖️➡️🏘️💌 '

sleep(0.5)

charity_support1 = CharitySupport.new(
  newsletter: true)
charity_support1.user = olivia_host_user
charity_support1.charity = charity_one
charity_support1.save!

puts '🙆‍♀️➡️🧢💌  Assiging Representative Leia to
Charity Mencap with newsletter = true 🙆‍♀️➡️🧢💌  '

sleep(0.5)

charity_support2 = CharitySupport.new(
  newsletter: true)
charity_support2.user = leia_charityrep_user
charity_support2.charity = charity_two
charity_support2.save!

sleep(0.5)


puts 'D👽NE'
puts '🥇🥇🥇🥇'





