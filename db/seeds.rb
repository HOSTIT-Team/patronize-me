# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

100.times do 
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.safe_email(name: first_name)
  user = User.new(email: email, first_name: first_name, last_name: last_name)
  user.password = "123456"
  user.phone_number = Faker::PhoneNumber.cell_phone_in_e164
  user.bio = Faker::TvShows::HowIMetYourMother.quote
  user.save!

  10.times do
    offer = Offer.new(user: user)
    offer.price = rand(50..1500)
    offer.category = Offer::CATEGORY.sample
    offer.city = Offer::CITY.sample
    offer.description = Faker::Lorem.paragraph(sentence_count: 2)
    offer.delivery_type = []
end

t.string "title"
    t.string "category"
    t.integer "price"
    t.bigint "user_id", null: false
    t.string "city"
    t.string "delivery_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"