# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create!(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

# creating date locations
coffee_date_1 = DateLocation.create!(
  name: "Allpress London Roastery",
  address: "55 Dalston Ln, London E8 2NG",
  date_type: "Coffee"
)
coffee_file_1 = URI.open("https://res.cloudinary.com/dxjcsnwea/image/upload/v1678805289/Allpress_coffee_axh5a1.jpg")
coffee_date_1.photo.attach(io: coffee_file_1, filename: "coffee_pic_1", content_type: "image/png")

coffee_date_2 = DateLocation.create!(
  name: "Rosslyn Coffee",
  address: "78 Queen Victoria St, London EC4N 4SJ",
  date_type: "Coffee"
)
coffee_file_2 = URI.open("https://res.cloudinary.com/dxjcsnwea/image/upload/v1678805289/Rosslyn_coffee_qnonmx.jpg")
coffee_date_2.photo.attach(io: coffee_file_2, filename: "coffee_pic_2", content_type: "image/png")

coffee_date_3 = DateLocation.create!(
  name: "Kaffeine",
  address: "66 Great Titchfield St., London W1W 7QJ",
  date_type: "Coffee"
)
coffee_file_3 = URI.open("https://res.cloudinary.com/dxjcsnwea/image/upload/v1678805290/Kaffeien_ot0zsu.jpg")
coffee_date_3.photo.attach(io: coffee_file_3, filename: "coffee_pic_3", content_type: "image/png")

outdoors_date_1 = DateLocation.create!(
  name: "Kyoto Gardens",
  address: "Holland Park, W11 4UA",
  date_type: "Outdoors"
)
outdoor_file_1 = URI.open("https://res.cloudinary.com/dxjcsnwea/image/upload/v1678805289/kyoto_gardens_uqop3a.jpg")
outdoors_date_1.photo.attach(io: outdoor_file_1, filename: "outdoors_pic_1", content_type: "image/png")

outdoors_date_2 = DateLocation.create!(
  name: "Regent's Canal Walk",
  address: "Granary Square, London N1C 4BH",
  date_type: "Outdoors"
)
outdoor_file_2 = URI.open("https://res.cloudinary.com/dxjcsnwea/image/upload/v1678805289/regents_canal_walk_qxrd4s.jpg")
outdoors_date_2.photo.attach(io: outdoor_file_2, filename: "outdoors_pic_2", content_type: "image/png")

outdoors_date_3 = DateLocation.create!(
  name: "Isabella Plantation",
  address: "Richmond Park, TW10 5HS",
  date_type: "Outdoors"
)
outdoor_file_3 = URI.open("https://res.cloudinary.com/dxjcsnwea/image/upload/v1678805289/isabella_plantation_bk9bun.jpg")
outdoors_date_3.photo.attach(io: outdoor_file_3, filename: "outdoors_pic_3", content_type: "image/png")

cocktails_date_1 = DateLocation.create!(
  name: "Zetter Townhouse",
  address: "49 St John's Sq, London EC1V 4JJ",
  date_type: "Cocktails"
)
cocktail_file_1 = URI.open("https://res.cloudinary.com/dxjcsnwea/image/upload/v1678805290/zetter_townhouse_qukrlm.jpg")
cocktails_date_1.photo.attach(io: cocktail_file_1, filename: "cocktails_pic_1", content_type: "image/png")

cocktails_date_2 = DateLocation.create!(
  name: "The Blind Pig",
  address: "58 Poland St, London W1F 7NR",
  date_type: "Cocktails"
)

cocktail_file_2 = URI.open("https://res.cloudinary.com/dxjcsnwea/image/upload/v1678805289/bling_pig_d1moox.jpg")
cocktails_date_2.photo.attach(io: cocktail_file_2, filename: "cocktails_pic_2", content_type: "image/png")

cocktails_date_3 = DateLocation.create!(
  name: "Tayēr + Elementary",
  address: "152 Old St, London EC1V 9BW",
  date_type: "Cocktails"
)
cocktail_file_3 = URI.open("https://res.cloudinary.com/dxjcsnwea/image/upload/v1678805290/tayer_and_elementary_wzfxig.jpg")
cocktails_date_3.photo.attach(io: cocktail_file_3, filename: "cocktails_pic_3", content_type: "image/png")

puts "date locations created"

# create 1 male users

puts "creating matt"

matt = User.create!(
  email: "matt@matt.com",
  password: "123456",
  first_name: "Matt",
  last_name: "Tate",
  gender: "male"
)
file = URI.open("https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tfGVufDB8fDB8fA%3D%3D&w=1000&q=80")
matt.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")


puts "created matt"


# create female users

puts "creating female users"

photos = [
  ["https://i.stack.imgur.com/8ctbL.jpg", "https://i.pinimg.com/474x/d9/f6/ef/d9f6ef84dcc9b8f7f345316af64583cc--kate-moss-color-photography.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEx6YvO_z-5BdFCB20Dw7K6H0_XszMe0tzw&usqp=CAU"],
  ["https://images.wallpapersden.com/image/download/alison-brie-2022-actress_bWptamiUmZqaraWkpJRmbmdlrWdnZ2U.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlka0FUoibb4Baa2wnB4-U5tX1F7FhhRv17A&usqp=CAU", "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f0b1f287-f030-41dc-872a-3320c923e910/d5mlhv7-49bc210c-c3ab-4842-8961-c1e6c52d96bc.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2YwYjFmMjg3LWYwMzAtNDFkYy04NzJhLTMzMjBjOTIzZTkxMFwvZDVtbGh2Ny00OWJjMjEwYy1jM2FiLTQ4NDItODk2MS1jMWU2YzUyZDk2YmMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.j3sCA3KejHEMZYq_NOUUAGVWSn5VZ0b8ycyriVFn0mc"],
  ["http://images6.fanpop.com/image/photos/32400000/Jason-Bell-Photoshoot-marisa-tomei-32428343-2000-2056.jpg", "https://saucemonsters.com/wp-content/uploads/2017/07/Marisa-Tomei-08.jpg", "https://i1.wp.com/comicbooksgalaxy.com/wp-content/uploads/2019/08/marisa-tomei-bikini.jpg?resize=696%2C931&ssl=1"],
  ["https://i.pinimg.com/originals/b2/ab/2c/b2ab2c010daa338dffb53997f929c8d6.jpg", "https://people.com/thmb/IFdCq1vT35k9uUHpGL15YmJXmOg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(497x0:499x2)/naomi-campbell-throwback-3-bcee8e478ade4d0a95dd710c818a8f4d.jpg", "https://www.theplace2.ru/cache/archive/naomi_campbell/img/naomi_v_5-gthumb-gwdata1200-ghdata1200-gfitdatamax.jpg"],
  ["https://i.pinimg.com/originals/76/01/6b/76016b6eb23cc715871a68d62b7df5fe.jpg", "https://www.the-sun.com/wp-content/uploads/sites/6/2021/07/NINTCHDBPICT000611344585.jpg", "https://i.pinimg.com/474x/a1/38/c2/a138c23356a4c3e3cb15ed43b851479b.jpg"],
  ["https://image.tmdb.org/t/p/w500/t1xPA67A2VoQwjEC43hmOzEKNP3.jpg", "https://images.mubicdn.net/images/cast_member/30189/cache-138037-1463176674/image-w856.jpg", "https://akns-images.eonline.com/eol_images/Entire_Site/20141021/rs_600x600-141121082803-600.Roselyn-Sanchez-Latin-Grammy-Awards-JR-112114.jpg?fit=around%7C1080:1080&output-quality=90&crop=1080:1080;center,top"],
  ["https://media1.popsugar-assets.com/files/thumbor/QbnFy3xen-tFSFaXAMDE8h2NuHY/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2021/10/25/844/n/1922398/4353611607e2aa09_GettyImages-634915242/i/She-Majored-in-French-at-Skidmore-College.jpg", "https://static.wikia.nocookie.net/dcmovies/images/1/17/Zazie_Beetz.jpg/revision/latest?cb=20180918151723", "https://images.squarespace-cdn.com/content/v1/56c346b607eaa09d9189a870/ca23d2a7-5698-4ac5-95dc-59acfd6fb9dc/178_Flaunt_Magazine_The_Gift_Issue_Digital_Cover_Print_Flaunt.com_Web_Zazie_Beetz1.jpg"],
  ["https://media.wonderlandmagazine.com/uploads/2021/05/Little-Simz-Cover-Blank.jpg","https://media.timeout.com/images/105795896/image.jpg", "https://media.gq.com/photos/56393d2ab318c58a03060e33/master/pass/wcw-lil-simz_720.jpg"],
  ["https://cdn.britannica.com/75/124975-050-32A8692C/Aishwarya-Bachchan-Rai.jpg", "https://assets.vogue.in/photos/5e96a8ffbc37e000082170e3/2:3/w_449,h_674,c_limit/Aishwarya%20Rai%20beauty%20evolution.jpg", "https://recipes.timesofindia.com/photo/90983897/90983897.jpg"],
  ["https://www.you.co.uk/wp-content/uploads/2018/07/kristen-bell-3.jpg", "https://s.yimg.com/ny/api/res/1.2/YxtmHY5wlq29wYb93flHeg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTg3MA--/https://media.zenfs.com/en-US/homerun/people_218/07f9948519d5c06cb350e160ecc5800f", "https://m.media-amazon.com/images/M/MV5BMjA1Njc0MTUzN15BMl5BanBnXkFtZTgwNTg1MjEwNDI@._V1_.jpg"],
  ["https://e0.pxfuel.com/wallpapers/390/574/desktop-wallpaper-margot-robbie-black-margot-robbie-black-and-white.jpg", "https://cdnb.artstation.com/p/assets/images/images/017/435/749/large/jinny-gantumur-asset.jpg?1555983602", "https://assets.vogue.com/photos/637bd7850682bf4c03d791b7/master/w_2560%2Cc_limit/GettyImages-1426056495.jpg"],
  ["https://m.media-amazon.com/images/M/MV5BMTU5NDE1NzM5OF5BMl5BanBnXkFtZTcwNzQ1NTE3Nw@@._V1_.jpg","https://deadline.com/wp-content/uploads/2016/06/angelababy.jpg", "https://assets.vogue.com/photos/5891312ae8e3104f57c719c3/master/pass/angelababy.jpg"],
  ["https://assets.vogue.in/photos/5fa804da0342dcd04d761b1f/2:3/w_2172,h_3258,c_limit/Vogue%20Shilpa%20Shetty%20Kundra%20Bulgari.jpg","https://static.toiimg.com/thumb/msid-96862971,imgsize-52694,width-900,height-1200,resizemode-6/96862971.jpg","https://i.dailymail.co.uk/1s/2022/02/08/11/53916763-0-image-a-3_1644318499338.jpg"],
  ["https://nypost.com/wp-content/uploads/sites/2/2020/12/tina-louise-dawn-wells-dead-10.jpg","https://i.etsystatic.com/31474144/r/il/45f4b9/3417158940/il_570xN.3417158940_k9bw.jpg","https://cdn.smehost.net/masterworksbroadwaycom-45pressprod/wp-content/uploads/2015/02/PBDTILO_EC002_H.jpg"],
  ["https://thumbs.dreamstime.com/b/daria-gavrilova-aus-rome-italy-may-her-st-round-match-against-sabine-lisicki-ger-internazionali-bnl-d-italia-rome-71196188.jpg","https://i.pinimg.com/originals/21/08/8d/21088d077715b36518a12e915dea0542.jpg", "https://pbs.twimg.com/media/E0XifjwWEAEh1kC.jpg"]
]


# creating set user 1 to decline

photo_array_counter = 0

puts "creating setuser1"

user1 = User.create!(
  email: "setuser1@test.com",
  password: "123456",
  first_name: "Kate",
  last_name: "ln set user 1",
  gender: "female"
)
user_pics = photos[photo_array_counter]
user_pics_counter = 0
3.times do
  file = URI.open(user_pics[user_pics_counter])
  user1.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")
  user_pics_counter +=1
end
photo_array_counter += 1


# creating set user 2 to decline

puts "creating setuser2"

user2 = User.create!(
  email: "setuser2@test.com",
  password: "123456",
  first_name: "Amelia",
  last_name: "ln set user 2",
  gender: "female"
)
user_pics = photos[photo_array_counter]
user_pics_counter = 0
3.times do
  file = URI.open(user_pics[user_pics_counter])
  user2.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")
  user_pics_counter +=1
end
photo_array_counter += 1


# creating set user 3 to view and decline

puts "creating setuser3"

user3 = User.create!(
  email: "setuser3@test.com",
  password: "123456",
  first_name: "Isla",
  last_name: "ln set user 3",
  gender: "female"
)
user_pics = photos[photo_array_counter]
user_pics_counter = 0
3.times do
  file = URI.open(user_pics[user_pics_counter])
rescue
  user3.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")
  user_pics_counter +=1
end
photo_array_counter += 1


# creating set user 4 to view and accept

puts "creating setuser4"

user4 = User.create!(
  email: "setuser4@test.com",
  password: "123456",
  first_name: "Grace",
  last_name: "ln set user 4",
  gender: "female"
)
user_pics = photos[photo_array_counter]
user_pics_counter = 0
3.times do
  file = URI.open(user_pics[user_pics_counter])
  user4.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")
  user_pics_counter +=1
end
photo_array_counter += 1


# creating set user 5 to have a match with and she makes date suggestion

puts "creating setuser5"

user5 = User.create!(
  email: "setuser5@test.com",
  password: "123456",
  first_name: "Emma",
  last_name: "ln set user 5",
  gender: "female"
)
user_pics = photos[photo_array_counter]
user_pics_counter = 0
3.times do
  file = URI.open(user_pics[user_pics_counter])
  user5.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")
  user_pics_counter +=1
end
photo_array_counter += 1


# creating set user 6 to have a match with and we do lucky dip

puts "creating setuser6"


user6 = User.create!(
  email: "setuser6@test.com",
  password: "123456",
  first_name: "Willow",
  last_name: "ln set user 6",
  gender: "female"
)
user_pics = photos[photo_array_counter]
user_pics_counter = 0
3.times do
  file = URI.open(user_pics[user_pics_counter])
  user6.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")
  user_pics_counter +=1
end
photo_array_counter += 1


# creating set user 7 to have a match with and we do multi-select

puts "creating setuser7"


user7 = User.create!(
  email: "setuser7@test.com",
  password: "123456",
  first_name: "Sienna",
  last_name: "ln set user 7",
  gender: "female"
)
user_pics = photos[photo_array_counter]
user_pics_counter = 0
3.times do
  file = URI.open(user_pics[user_pics_counter])
  user7.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")
  user_pics_counter +=1
end
photo_array_counter += 1


# creating set user 8 to have a match with

puts "creating setuser8"


user8 = User.create!(
  email: "setuser8@test.com",
  password: "123456",
  first_name: "Katie",
  last_name: "ln set user 8",
  gender: "female"
)
user_pics = photos[photo_array_counter]
user_pics_counter = 0
3.times do
  file = URI.open(user_pics[user_pics_counter])
  user8.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")
  user_pics_counter +=1
end
photo_array_counter += 1


# creating set user 9 to have a match with

puts "creating setuser9"


user9 = User.create!(
  email: "setuser9@test.com",
  password: "123456",
  first_name: "Marcola",
  last_name: "ln set user 9",
  gender: "female"
)
user_pics = photos[photo_array_counter]
user_pics_counter = 0
3.times do
  file = URI.open(user_pics[user_pics_counter])
  user9.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")
  user_pics_counter +=1
end
photo_array_counter += 1


# creating set user 10 to have a match with

puts "creating setuser10"


user10 = User.create!(
  email: "setuser10@test.com",
  password: "123456",
  first_name: "Sam",
  last_name: "ln set user 10",
  gender: "female"
)
user_pics = photos[photo_array_counter]
user_pics_counter = 0
3.times do
  file = URI.open(user_pics[user_pics_counter])
  user10.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")
  user_pics_counter +=1
end
photo_array_counter += 1


puts "creating 5 random female users"

counter = 0
5.times do
  user = User.create!(
    email: "test#{counter}@test.com",
    password: "123456",
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    gender: "female"
  )
  user_pics = photos[photo_array_counter]
  user_pics_counter = 0
  3.times do
    file = URI.open(user_pics[user_pics_counter])
    user.photos.attach(io: file, filename: "profile_pic", content_type: "image/png")
    user_pics_counter +=1
  end
  counter += 1
  photo_array_counter += 1
  puts "creating random user #{counter}"
end

puts "female users created"

puts "creating swipes for matches"

swiper_match_counter = 2
15.times do
  Swipe.create!(
    islike: true,
    swipee_id: User.first.id,
    swiper_id: swiper_match_counter
  )
  swiper_match_counter += 1
end

puts "creating swipes the other way"

other_way_counter = 6
6.times do
  this_swipe = Swipe.create!(
    islike: true,
    swipee_id: other_way_counter,
    swiper_id: User.first.id
  )
  Match.create!(
    swipe_id: this_swipe.id
  )
  other_way_counter += 1
end

puts "swipes created"

SuggestedDate.create!(
  time: "8pm",
  date: "Sat 1st Apr",
  date_location_id: 7,
  match_id: 1,
  status: "proposed",
  user_id: 6
)

puts "one message in 3 matches to make index page look nice"

Message.create!(
  content: "Had a great time last week!",
  chatroom_id: 4,
  user_id: 9
)

Message.create!(
  content: "Escape Room was fun, down for a second date?",
  chatroom_id: 5,
  user_id: 10
)

Message.create!(
  content: "See you as more of a friend if I'm honest",
  chatroom_id: 6,
  user_id: 11
)

puts "messages for user 5"

user_5_messages = ["Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!"]
matts_messages = ["Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!", "Ooops, got a a demo to attend!"]
msg_counter = 0
7.times do
  Message.create!(
    content: matts_messages[msg_counter],
    chatroom_id: 1,
    user_id: 1
  )
  Message.create!(
    content: user_5_messages[msg_counter],
    chatroom_id: 1,
    user_id: 6
  )
  msg_counter += 1
end

puts "messages for user 6"

user_6_messages = ["Hey", "Nothing much, you?", "Wow, this is riveting conversation", "Cool", "cool", "cool", "Yep :)"]
matts_messages = ["Hey :)", "Wuu2?", "Yeah same", "Yeah ikr", "cool", "cool", "Date then?"]
msg_counter = 0
7.times do
  Message.create!(
    content: matts_messages[msg_counter],
    chatroom_id: 2,
    user_id: 1
  )
  Message.create!(
    content: user_6_messages[msg_counter],
    chatroom_id: 2,
    user_id: 7
  )
  msg_counter += 1
end

puts "messages for user 7"

user_7_messages = ["*insert funny chatup line here*", "beepboop beepboop beepboop beepboop", "*insert very funny joke here*", "allalalalalalalalalal", "yes", "*insert intresting question here*", "wow very intresting"]
matts_messages = ["*insert witty response here*", "boopbeep boopbeep boopbeep", "that was a terrible joke", "lalalalalalalallalal", "yes", "*very heart felt answer*", "thank you"]
msg_counter = 0
7.times do
  Message.create!(
    content: user_7_messages[msg_counter],
    chatroom_id: 3,
    user_id: 8
  )
  Message.create!(
    content: matts_messages[msg_counter],
    chatroom_id: 3,
    user_id: 1
  )
  msg_counter += 1
end

# t.string "content"
# t.bigint "chatroom_id", null: false
# t.bigint "user_id", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
# t.index ["user_id"], name: "index_messages_on_user_id"
