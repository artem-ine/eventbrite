# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'

5.times do 
  username = Faker::Internet.unique.username
  user = User.create(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: "#{username}@yopmail.com",
    description: Faker::Quote.famous_last_words,
    encrypted_password: "test"
  )
end 


10.times do
  user = User.all.sample
  event = Event.create(
    start_date: Faker::Date.forward(days: 30),
    duration: Faker::Number.between(from: 1, to: 100).round(-1),
    title: Faker::Lorem.sentence(word_count: 4),
    description: Faker::Lorem.sentence(word_count: 10),
    price: Faker::Number.between(from: 1, to: 1000),
    location: Faker::Address.city,
    user: user
  )
end


10.times do
  user = User.all.sample
  event = Event.all.sample
  attendance = Attendance.create(
    stripe_customer_id: "string",
    user: user,
    event: event
  )
end