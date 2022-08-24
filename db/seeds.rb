# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning the database..."
Service.destroy_all
Category.destroy_all
User.destroy_all
Booking.destroy_all

puts "Creating categories..."
education = Category.create!(name: "Education", image: "grammar.png")
care = Category.create!(name: "Care", image: "charity.png")
transport = Category.create!(name: "Transport", image: "trolley.png")
consulting = Category.create!(name: "Consulting", image: "business.png")
cleaning = Category.create!(name: "Cleaning", image: "sweep.png")
home = Category.create!(name: "Home", image: "paint-brush.png")
miscellaneous = Category.create!(name: "Miscellaneous", image: "clock.png")

puts "Creating users..."

frank = User.create!(email: "frank@gmail.com", password: "lewagon", first_name: "Frank",
  last_name: "Gerngroß", nickname: "Frank", bio: "I'm a graphic designer and web developer
  living in Berlin. I´m currently launching my new app called 'BoxTag' (check it out!).
  Since I am an excellent driver and quite strong, I can help you out with packing and moving
  within the Berlin and it´s surroundings.", language: "German and English", credit: 7)

monica = User.create!(email: "monica@gmail.com", password: "lewagon", first_name: "Monica",
  last_name: "Jara", nickname: "Mó", bio: "Hola! I am an economist currently
  working and studying web development at LeWagon in Berlin. I am a native German and Spanish
  speaker. Check out my offers! ", language: "German and English", credit: 4)

carlos = User.create!(email: "carlos@gmail.com", password: "lewagon", first_name: "Carlos",
 last_name: "Montero", nickname: "Carlitos", bio: "I am Carlos from Colombia. I have been living
  in Berlin since 2018 and work as a spanish and maths teacher in a local school.
  I am also a passionate guitar player", language: "Spanish and English", credit: 3)

andrea = User.create!(email: "andrea@gmail.com", password: "lewagon", first_name: "Andrea",
 last_name: "Hoffmann", nickname: "Andy", bio: "Hey, I am Andrea from Potsdam. I am a professional
 electrician and can help you out with any kind of small installations in the house and with
 general advice. I am usually available on weekends.", language: "English and German", credit: 5)

boris = User.create!(email: "boris@gmail.com", password: "lewagon", first_name: "Boris",
  last_name: "Gojak", nickname: "Boris", bio: "I am a professional tax advisor. I specialized in
  corporate tax and personal tax based on german law", language: "English and German", credit: 9)

carla = User.create!(email: "carla@gmail.com", password: "lewagon", first_name: "Carla",
  last_name: "Gui", nickname: "Carla", bio: "I am Carla from Spain and arrived a couples of
  weeks ago to Berlin. I love taking care of children and I am currently studying to be a
  nurse.", language: "English and Spanish", credit: 3)

john = User.create!(email: "john@gmail.com", password: "lewagon", first_name: "John",
  last_name: "Watson", nickname: "Johny", bio: "Greetings! I am a professional psychologist
  from England, specialized in anxiety disorders. I have my own practice in East London
  since 2009 and would be happy to give some advice to anyone who needs help.",
  language: "English and Spanish", credit: 3)

puts "Creating services..."
packing = Service.create!(name: "Help packing", description: "If you have too much stuff
  laying around that needs to be stored or if you are about to move and need some help, I
  am the one for you. I am so passionate about it that I developed an app so you can have
  an overview of all your belongings without efford", location: "Berlin",
  monday: false, tuesday: true, wednesday: true, thursday: true, friday: false,
  saturday: true, sunday: true, user_id: frank.id, category_id: transport.id)

moving = Service.create!(name: "Help moving", description: "I have a van and can help you
  move within Berlin and to it´s surroundings. I can also help carrying your boxes
  and furniture", location: "Berlin", monday: false, tuesday: false, wednesday: false,
  thursday: false, friday: false, saturday: true, sunday: true, user_id: frank.id, category_id: transport.id)

translation = Service.create!(name: "Translation Spanish - German", description: "I am
  not a professional translator, but I can help with any kind of basic translations, like
  letters from the Behörde or calling your phone company.", location: "Berlin and Remote",
  monday: true, tuesday: false, wednesday: true, thursday: false, friday: true, saturday: false,
  sunday: true, user_id: monica.id, category_id: consulting.id)

organizing = Service.create!(name: "Organize your home", description: "Do you feel
  you have too much stuff and don´t know how to store it in your house? I can help you
  with that. We can sort out and put away all the things you don´t need.", location: "Berlin",
  monday: true, tuesday: false, wednesday: true, thursday: false, friday: true, saturday: false,
  sunday: true, user_id: monica.id, category_id: cleaning.id)

dogsitting = Service.create!(name: "Dogsitting", description: "I love dogs! And I was
  never allowed to have one. Let me take care of your dog and you will make the dog and specially
  me very happy :)", location: "Berlin",
  monday: true, tuesday: false, wednesday: true, thursday: false, friday: true, saturday: false,
  sunday: true, user_id: monica.id, category_id: care.id)

spanish_lessons = Service.create!(name: "Spanish lessons", description: "I offer Spanish
  lessons on all levels. If you live in Berlin we can meet in person, but I am
  also available for remote lessons ;)", location: "Remote and Berlin",
  monday: false, tuesday: true, wednesday: false, thursday: true, friday: false,
  saturday: true, sunday: false, user_id: carlos.id, category_id: education.id)

guitar_lessons = Service.create!(name: "Guitar lessons", description: "I offer guitar
  lessons on a basic to intermediate level. Feel free to pick any song! I am currently
  looking for a second guitar player for my band... it could be you.", location: "Berlin",
  monday: false, tuesday: true, wednesday: false, thursday: true, friday: false,
  saturday: true, sunday: false, user_id: carlos.id, category_id: education.id)

shopping = Service.create!(name: "Grocery shopping", description: "If you live in Berlin and
  cannot leave the house or if you have an elderly relative who can´t carry heavy bags, I can
  help you with that. I can go to the nearest supermarket and take care of your shopping list",
  location: "Berlin", monday: false, tuesday: false, wednesday: false, thursday: false, friday: true,
  saturday: true, sunday: false, user_id: carlos.id, category_id: miscellaneous.id)

electrical_work = Service.create!(name: "Electrical work", description: "I can help with small installations
  in the house. I work connecting and disconnecting electricity supply wiring to electrical equipment",
  location: "Berlin and Potsdam", monday: false, tuesday: true, wednesday: false, thursday: false, friday: false,
  saturday: true, sunday: true, user_id: andrea.id, category_id: home.id)

electrical_advice = Service.create!(name: "Teaching basics on electricity", description: "I can teach
  how to install lamps and solve any question you might have around electric equipment",
  location: "Berlin, Potsdam and Remote", monday: false, tuesday: true, wednesday: false,
  thursday: false, friday: false, saturday: true, sunday: true, user_id: andrea.id, category_id: education.id)

tax_advice = Service.create!(name: "Tax advice", description: "If you need help doing your personal tax declaration
  or advice on how to set up your startup regarding tax issures, let me know.",
  location: "Berlin or Remote", monday: true, tuesday: true, wednesday: true, thursday: true, friday: false,
  saturday: false, sunday: false, user_id: boris.id, category_id: consulting.id)

babysitting = Service.create!(name: "Babysitting", description: "I can offer to take care
  of your children (max. 3) so that you can have some time for yourself. Spanish speaking families or
  parents who want their children to learn Spanish are very welcomed. I have already vast experience in taking
  care of babies and small children.", location: "Berlin", monday: false, tuesday: false, wednesday: false,
  thursday: false, friday: false, saturday: true, sunday: true, user_id: carla.id, category_id: care.id)

spanish_lessons_2 = Service.create!(name: "Babysitting", description: "Since I am a native Spanish speaker
  I offer Spanish lessons on a basic level for children between 5 and 8 years", location: "Berlin and Remote",
  monday: true, tuesday: false, wednesday: false, thursday: false, friday: false, saturday: true, sunday: true,
  user_id: carla.id, category_id: education.id)

cleaning = Service.create!(name: "Cleaning", description: "I can clean small apartments, but I don´t do
  bathrooms. I can help you with the kitchen and even do your wash.", location: "Berlin",
  monday: true, tuesday: false, wednesday: false, thursday: false, friday: false, saturday: true, sunday: true,
  user_id: carla.id, category_id: cleaning.id)

psychological_advice = Service.create!(name: "Psychological advice", description: "I can share basic strategies
  and good advice regarding anxiety and panic attacs. Although this is no repracement of professional therapy,
  I can give you some insight on how to cope with inner turmoil and unpleasend feelings", location: "London and Remote",
  monday: true, tuesday: false, wednesday: true, thursday: false, friday: false, saturday: true, sunday: false,
  user_id: john.id, category_id: miscellaneous.id)

puts "Creating bookings..."

booking_1 = Booking.create(start_date: Date.new(2022, 4, 3), end_date: Date.new(2022, 4, 3), user_id: andrea.id, service_id: babysitting.id)
booking_2 = Booking.create(start_date: Date.new(2022, 4, 3), end_date: Date.new(2022, 4, 3), user_id: carlos.id, service_id: electrical_advice.id)
booking_1 = Booking.create(start_date: Date.new(2022, 2, 9), end_date: Date.new(2022, 2, 9), user_id: andrea.id, service_id: spanish_lessons.id)
booking_2 = Booking.create(start_date: Date.new(2022, 8, 5), end_date: Date.new(2022, 8, 5), user_id: boris.id, service_id: electrical_work.id)

puts "Done"
