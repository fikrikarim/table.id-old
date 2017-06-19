# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
randomtext = "Sportsman do offending supported extremity breakfast by listening. Decisively advantages nor expression unpleasing she led met. Estate was tended ten boy nearer seemed. As so seeing latter he should thirty whence. Steepest speaking up attended it as. Made neat an on be gave show snug tore.

Unpacked now declared put you confined daughter improved. Celebrated imprudence few interested especially reasonable off one. Wonder bed elinor family secure met. It want gave west into high no in. Depend repair met before man admire see and. An he observe be it covered delight hastily message. Margaret no ladyship endeavor ye to settling.

Rooms oh fully taken by worse do. Points afraid but may end law lasted. Was out laughter raptures returned outweigh. Luckily cheered colonel me do we attacks on highest enabled. Tried law yet style child. Bore of true of no be deal. Frequently sufficient in be unaffected. The furnished she concluded depending procuring concealed.

Am of mr friendly by strongly peculiar juvenile. Unpleasant it sufficient simplicity am by friendship no inhabiting. Goodness doubtful material has denoting suitable she two. Dear mean she way and poor bred they come. He otherwise me incommode explained so in remaining. Polite barton in it warmly do county length an.

Examine she brother prudent add day ham. Far stairs now coming bed oppose hunted become his. You zealously departure had procuring suspicion. Books whose front would purse if be do decay. Quitting you way formerly disposed perceive ladyship are. Common turned boy direct and yet.

Old unsatiable our now but considered travelling impression. In excuse hardly summer in basket misery. By rent an part need. At wrong of of water those linen. Needed oppose seemed how all. Very mrs shed shew gave you. Oh shutters do removing reserved wandered an. But described questions for recommend advantage belonging estimable had. Pianoforte reasonable as so am inhabiting. Chatty design remark and his abroad figure but its.

Give lady of they such they sure it. Me contained explained my education. Vulgar as hearts by garret. Perceived determine departure explained no forfeited he something an. Contrasted dissimilar get joy you instrument out reasonably. Again keeps at no meant stuff. To perpetual do existence northward as difficult preserved daughters. Continued at up to zealously necessary breakfast. Surrounded sir motionless she end literature. Gay direction neglected but supported yet her.

Whole every miles as tiled at seven or. Wished he entire esteem mr oh by. Possible bed you pleasure civility boy elegance ham. He prevent request by if in pleased. Picture too and concern has was comfort. Ten difficult resembled eagerness nor. Same park bore on be. Warmth his law design say are person. Pronounce suspected in belonging conveying ye repulsive.

And sir dare view but over man. So at within mr to simple assure. Mr disposing continued it offending arranging in we. Extremity as if breakfast agreement. Off now mistress provided out horrible opinions. Prevailed mr tolerably discourse assurance estimable applauded to so. Him everything melancholy uncommonly but solicitude inhabiting projection off. Connection stimulated estimating excellence an to impression.

Do am he horrible distance marriage so although. Afraid assure square so happen mr an before. His many same been well can high that. Forfeited did law eagerness allowance improving assurance bed. Had saw put seven joy short first. Pronounce so enjoyment my resembled in forfeited sportsman. Which vexed did began son abode short may. Interested astonished he at cultivated or me. Nor brought one invited she produce her.
"

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
                    text: randomtext,
                    user: user1

post2 = Post.create! title: "[OSN Story] Jalan-jalan dan dibayar",
                    text: randomtext,
                    user: user2

post3 = Post.create! title: "Planet baru yang sangat mirip bumi ditemukan",
                    text: randomtext,
                    user: user3

post4 = Post.create! title: "[OSN Story] Mencari Ridho Tuhan",
                    text: randomtext,
                    user: user4

post5 = Post.create! title: "[OSN Story] Kenangan yang paling indah disaat SMA",
                    text: randomtext,
                    user: user5

post6 = Post.create! title: "Samsung galaxy S14 diluncurkan",
                    text: randomtext,
                    user: user6

post7 = Post.create! title: "[OSN Story] Provinsi aja ngga lolos",
                    text: randomtext,
                    user: user7

post8 = Post.create! title: "[OSN Story] Mencari Ridho Tuhan",
                    text: randomtext,
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





