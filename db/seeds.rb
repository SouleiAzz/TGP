# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Faker::UniqueGenerator.clear

City.destroy_all
User.destroy_all
PrivateMessage.destroy_all
JoinPrivateMessageReceiver.destroy_all
Tag.destroy_all
Gossip.destroy_all
JoinGossipTag.destroy_all
Comment.destroy_all
CommentOfComment.destroy_all
Like.destroy_all
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

until City.count == 10
  City.create(name: Faker::Address.unique.city, zip_code: Faker::Address.unique.zip_code)
end
until User.count == 20
  name = Faker::Name.first_name
  lname = Faker::Name.last_name
  ename = name + lname[0]
  User.create(first_name: name, last_name: lname, description: Faker::ChuckNorris.fact, age: (15..75).to_a.sample, email: Faker::Internet.unique.email(name: ename, domain: 'brazzers'), city: City.all.sample, password: '123456')
end
until Gossip.count == 20
  Gossip.create(user: User.all.sample, title: Faker::Book.unique.title, content: Faker::TvShows::SouthPark.quote)
end
until Tag.count == 10
  Tag.create(title: Faker::Book.unique.genre)
end
Gossip.all.each do |g|
  rand(1..5).times do
    JoinGossipTag.create(tag: Tag.all.sample, gossip: g)
  end
end
until PrivateMessage.count == 10 do
  PrivateMessage.create(sender: User.all.sample, content: Faker::Quote.unique.most_interesting_man_in_the_world)
  rand(1..5).times do
    JoinPrivateMessageReceiver.create(private_message: PrivateMessage.all.last, recipient: User.all.sample)
  end
end
until Comment.count == 20 do
  Comment.create(user: User.all.sample, gossip: Gossip.all.sample, content: Faker::ChuckNorris.fact)
end
until Like.count == 50 do
  Like.create(content: [true, false].sample ? Gossip.all.sample : Comment.all.sample, user: User.all.sample)
end
until CommentOfComment.count == 30 do
  CommentOfComment.create(user: User.all.sample, content: Faker::ChuckNorris.fact, comment: Comment.all.sample)
end
User.create(first_name: "admin", last_name: "admin", description: "admin"*3, age: 19, email: "admin@admin.admin", city: City.first, password: 'admin0')
