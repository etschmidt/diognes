# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
25.times do |n|
  name  = Faker::Ancient.hero
  email = "example-#{n+1}@gymbull.com"
  password = "Password1"
  description = Faker::Lorem.paragraph(2)
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               description: description, 
               private: false)
end

users = User.order(:created_at).offset(1).take(5)
5.times do\
  content = Faker::StarWars.quote
  users.each { |user| user.posts.create!(content: content)}
end

users = User.order(:created_at).offset(6).take(5)
5.times do\
  content = Faker::TwinPeaks.quote
  users.each { |user| user.posts.create!(content: content)}
end

users = User.order(:created_at).offset(11).take(5)
5.times do\
  content = Faker::Hipster.paragraph
  users.each { |user| user.posts.create!(content: content)}
end

users = User.order(:created_at).offset(16).take(5)
5.times do\
  content = Faker::Hobbit.quote
  users.each { |user| user.posts.create!(content: content)}
end