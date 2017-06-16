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

post1 = Post.create! title: "[OSN Story] Perjuangan Keras Yang Membanggakan Kedua Orang Tua",
                    text: "Ini ceritaku, mana ceritamu",
                    user: user2

