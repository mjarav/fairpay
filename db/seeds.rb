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

puts "Creating categories..."
education = Category.create!(name: "Education", image: "grammar.png")
care = Category.create!(name: "Care", image: "charity.png")
transport = Category.create!(name: "Transport", image: "trolley.png")
consulting = Category.create!(name: "Consulting", image: "business.png")
cleaning = Category.create!(name: "Cleaning", image: "sweep.png")
home = Category.create!(name: "Home", image: "paint-brush.png")
miscellaneous = Category.create!(name: "Miscellaneous", image: "clock.png")

puts "Creating users..."
carlos = User.create!(email: "carlos@gmail.com", password: "lewagon", first_name: "Carlos",
 last_name: "Montero", nickname: "Carlitos", bio: "I am Carlos from Colombia. I have been living
  in Berlin since 2018 and work as a teacher in a local school. I love teaching and can teach all
  levels", language: "Spanish and English", credit: 3)

andrea = User.create!(email: "andrea@gmail.com", password: "lewagon", first_name: "Andrea",
 last_name: "Hoffmann", nickname: "Andy", bio: "Hey, I am Andrea from Berlin. I am a professional
 electrician and can help you out with any kind of small installations in the house and advice. I am
 usually available on weekends.
  levels", language: "English and German", credit: 3)

boris =User.create!(email: "boris@gmail.com", password: "lewagon", first_name: "Boris",
  last_name: "Gojak", nickname: "Boris", bio: "I am a professional tax advisor. I specialized in
  corporate tax and personal tax based on german law", language: "English and German", credit: 3)

carla =User.create!(email: "carla@gmail.com", password: "lewagon", first_name: "Carla",
  last_name: "Gui", nickname: "Carla", bio: "I am Carla from Spain and arrived a couples of
  weeks ago to Berlin. I love taking care of children and am currently studying to be a
  nurse.", language: "English and Spanish", credit: 3)

puts "Creating services..."
spanish_lessons = Service.create!(name: "Spanish lessons", description: "I am a professional teacher in a
  local school and would like to teach students arround the world. But in Berlin is also fine ;)",
 location: "remote and Berlin", monday: false, tuesday: true, wednesday: false, thursday: true, friday: false,
saturday: true, sunday: false, user_id: carlos.id, category_id: education.id)

electrical_work = Service.create!(name: "Electrical work", description: "I can help with small installations
  in the house. I work connecting electricity supply wiring to electrical equipment or disconnecting electricity
  supply wiring from electrical equipment",
 location: "Berlin", monday: false, tuesday: true, wednesday: false, thursday: false, friday: false,
saturday: true, sunday: true, user_id: andrea.id, category_id: home.id)

electrical_advice = Service.create!(name: "Teaching basics on electricity", description: "I can teach you
  how to install lamps and solve any question you might have around electricity",
 location: "Berlin or Remote", monday: false, tuesday: true, wednesday: false, thursday: false, friday: false,
saturday: true, sunday: true, user_id: andrea.id, category_id: education.id)

tax_advice = Service.create!(name: "Tax advice", description: "If you need help doing your personal tax declaration
  or advice on how to set up your startup regarding tax issures, let me know.",
 location: "Berlin or Remote", monday: true, tuesday: true, wednesday: true, thursday: true, friday: false,
saturday: false, sunday: false, user_id: boris.id, category_id: consulting.id)

babysitting = Service.create!(name: "Babysitting", description: "I have already vast experience in taking
  care of babies and small children.",
 location: "Berlin", monday: false, tuesday: false, wednesday: false, thursday: false, friday: false,
 saturday: true, sunday: true, user_id: carla.id, category_id: care.id)
