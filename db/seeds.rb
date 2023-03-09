# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

# creating date locations
puts "creating 30 date locations"
10.times do
  DateLocation.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    date_type: "Dinner date"
  )
end

10.times do
  DateLocation.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    date_type: "Outdoors"
  )
end

10.times do
  DateLocation.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    date_type: "Cocktails"
  )
end
puts "date locations created"

# create 1 male users
puts "creating male user"
User.create!(
  email: "chad@chad.com",
  password: "123456",
  first_name: "Chad",
  last_name: "Michaels",
  gender: "male"
)
puts "male user created"

# create female users
puts "creating 100 female users"
counter = 1
100.times do
  User.create!(
    email: "test#{counter}@test.com",
    password: "123456",
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    gender: "female"
  )
  counter += 1
end
puts "female users created"

# create swipes
puts "creating swipes for matches"
swipee_counter = 2
10.times do
  Swipe.create(
    islike: true,
    swipee_id: swipee_counter,
    swiper_id: 1
  )
  swipee_counter += 1
end

swiper_match_counter = 50
30.times do
  Swipe.create(
    islike: true,
    swipee_id: 1,
    swiper_id: swiper_match_counter
  )
  swiper_match_counter += 1
end
puts "swipes created"

# create matches
puts "creating matches from swipes"
swipe_counter = 1
10.times do
  Match.create(
    swipe_id: swipe_counter
  )
  swipe_counter += 1
end
puts "matches created"
