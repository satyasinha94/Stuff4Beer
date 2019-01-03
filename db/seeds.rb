# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




# Category.create(name: "Beer")
# Category.create(name: "Wine")
# Category.create(name: "Whiskey")
# Category.create(name: "Rum")
# Category.create(name: "Tequila")
# Category.create(name: "Gin")
#
# User.create(name: "Satya", email: "ssinha@example.com", password: "1234")
25.times do
  User.create(name: Faker::Name.unique.name, email: Faker::Internet.email, password: Faker::Internet.password)
end

# Listing.create(title: "l2", body: "4gh43h", user_id: 1, category_id: 1)
# Listing.create(title: "l3", body: "4gh4nhtn3h", user_id: 1, category_id: 2)
# Listing.create(title: "l4", body: "4grwegwh43h", user_id: 1, category_id: 3)
100.times do
  Listing.create(title: Faker::Beer.unique.name, body: Faker::Lorem.sentence, user_id: rand(User.first.id..User.last.id), category_id: 1)
end
