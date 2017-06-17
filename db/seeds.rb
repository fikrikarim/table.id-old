# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create! username: "fk",
                    email: "fkfikrikarim@gmail.com",
                    password: "NARUTO",
                    password_confirmation: "NARUTO"

user2 = User.create! username: "jh",
                    email: "skyczor@gmail.com",
                    password: "jamal321",
                    password_confirmation: "jamal321"

user3 = User.create! username: "annisa",
                    email: "annisa@gmail.com",
                    password: "123456",
                    password_confirmation: "123456"

user4 = User.create! username: "angga",
                    email: "angga@gmail.com",
                    password: "123456",
                    password_confirmation: "123456"

user5 = User.create! username: "maria",
                    email: "maria@gmail.com",
                    password: "123456",
                    password_confirmation: "123456"

user6 = User.create! username: "kris",
                    email: "kris@gmail.com",
                    password: "123456",
                    password_confirmation: "123456"

user7 = User.create! username: "david",
                    email: "david@gmail.com",
                    password: "123456",
                    password_confirmation: "123456"

user8 = User.create! username: "ica21",
                    email: "ica21@gmail.com",
                    password: "123456",
                    password_confirmation: "123456"

post1 = Post.create! title: "[OSN Story] Perjuangan Keras Yang Membanggakan Kedua Orang Tua",
                    text: "Ini ceritaku, mana ceritamu",
                    user: user1

post2 = Post.create! title: "[OSN Story] Jalan-jalan dan dibayar",
                    text: "Ini ceritaku, mana ceritamu",
                    user: user2

post3 = Post.create! title: "Planet baru yang sangat mirip bumi ditemukan",
                    text: "Ini ceritaku, mana ceritamu",
                    user: user3


post4 = Post.create! title: "[OSN Story] Mencari Ridho Tuhan",
                    text: "Ini ceritaku, mana ceritamu",
                    user: user4


post5 = Post.create! title: "[OSN Story] Kenangan yang paling indah disaat SMA",
                    text: "Ini ceritaku, mana ceritamu",
                    user: user5

post6 = Post.create! title: "Samsung galaxy S14 diluncurkan",
                    text: "Ini ceritaku, mana ceritamu",
                    user: user6

post7 = Post.create! title: "[OSN Story] Provinsi aja ngga lolos",
                    text: "Ini ceritaku, mana ceritamu",
                    user: user7

post8 = Post.create! title: "[OSN Story] Mencari Ridho Tuhan",
                    text: "Ini ceritaku, mana ceritamu",
                    user: user8

Post.all.each do |post|
  post.created_at = rand(1.days).seconds.ago
  post.save!
end

# To be deleted
Post.all.each do |post|
  post.cached_votes_score = rand(200)
  post.save!
end

Post.all.each do |post|
  rand(50).times {
    Comment.create! text: "test comment", user: User.first, post: post
  }
end





