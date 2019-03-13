d1 = "Willing to trade this for a bottle of Blue Label Jack Daniels"
d2 = "Always hated this stuff so I'm giving this away, first come first serve"
d3 = "Need help moving, and I'll give this booze to anyone who can help me move some of the bigger things."
d4 = "I can't drink this, not since the incident... so willing to swap it for any other booze."
d5 = "I will name my firstborn son Miller-Lite in exchange for 100 cans of it (and also give you the alcohol in the description)"
d6 = "Having a house party so willing to swap this for a keg of beer."
d7 = "Got some of this stuff for Christmas. Will exchange it for any other type of alcohol of similar quality."
d8 = "Giving up all booze for Lent and don't want any temptation, so I want to get rid of this ASAP."
d9 = "Been drinking too much of this recently and am bored of it. Will exchange for anything 'out there'."
d10 = "I'll trade this for 999 cans of Coors Light."
arr = [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10]

Category.create(name: "Beer")
Category.create(name: "Wine")
Category.create(name: "Whiskey")
Category.create(name: "Rum")
Category.create(name: "Tequila")
Category.create(name: "Gin")


User.create(name: "Satya", email: "ssinha@example.com", password: "1234")
25.times do
  User.create(name: Faker::Name.unique.name, email: Faker::Internet.email, password: Faker::Internet.password)
end

25.times do
  Listing.create(title: Faker::Beer.unique.name, body: arr.sample, user_id: rand(User.first.id..User.last.id), category_id: rand(1..6))
end


25.times do
  Comment.create(body: Faker::Quote.matz, user_id: rand(1..25), listing_id: rand(1..25))
end

25.times do
  Comment.create(body: Faker::TvShows::Simpsons.quote, user_id: rand(1..25), listing_id: rand(1..25))
end

25.times do
  Comment.create(body: Faker::Hipster.sentence, user_id: rand(1..25), listing_id: rand(1..25))
end
