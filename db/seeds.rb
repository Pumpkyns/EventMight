# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all

10.times do |i|
  first_name, last_name = Faker::FunnyName.two_word_name.split(' ')
  email = "#{Faker::Name.first_name.downcase}34@yopmail.com"
  description = "#{first_name} loves to #{Faker::Verb.base} in the nature with #{Faker::Superhero.name}."
  User.create(first_name: first_name, last_name: last_name, description: description, email: email)
end