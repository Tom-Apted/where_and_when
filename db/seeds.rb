# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

# creating date locations
puts "creating 30 date locations"
10.times do
  DateLocation.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    date_type: "Dinner date"
  )
end

10.times do
  DateLocation.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    date_type: "Outdoors"
  )
end

10.times do
  DateLocation.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    date_type: "Cocktails"
  )
end
puts "date locations created"

# create 1 male users
puts "creating male user"
User.create!(
  email: "matt@matt.com",
  password: "123456",
  first_name: "Matt",
  last_name: "Tate",
  gender: "male"
)
puts "male user created"

# create female users
puts "creating 10 female users"
photos = [
  ["https://i.stack.imgur.com/8ctbL.jpg", "https://i.pinimg.com/474x/d9/f6/ef/d9f6ef84dcc9b8f7f345316af64583cc--kate-moss-color-photography.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEx6YvO_z-5BdFCB20Dw7K6H0_XszMe0tzw&usqp=CAU"],
  ["https://i.pinimg.com/originals/b2/ab/2c/b2ab2c010daa338dffb53997f929c8d6.jpg", "https://people.com/thmb/IFdCq1vT35k9uUHpGL15YmJXmOg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(497x0:499x2)/naomi-campbell-throwback-3-bcee8e478ade4d0a95dd710c818a8f4d.jpg", "https://www.theplace2.ru/cache/archive/naomi_campbell/img/naomi_v_5-gthumb-gwdata1200-ghdata1200-gfitdatamax.jpg"],
  ["https://images.wallpapersden.com/image/download/alison-brie-2022-actress_bWptamiUmZqaraWkpJRmbmdlrWdnZ2U.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlka0FUoibb4Baa2wnB4-U5tX1F7FhhRv17A&usqp=CAU", "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f0b1f287-f030-41dc-872a-3320c923e910/d5mlhv7-49bc210c-c3ab-4842-8961-c1e6c52d96bc.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2YwYjFmMjg3LWYwMzAtNDFkYy04NzJhLTMzMjBjOTIzZTkxMFwvZDVtbGh2Ny00OWJjMjEwYy1jM2FiLTQ4NDItODk2MS1jMWU2YzUyZDk2YmMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.j3sCA3KejHEMZYq_NOUUAGVWSn5VZ0b8ycyriVFn0mc"],
  ["https://i.pinimg.com/originals/76/01/6b/76016b6eb23cc715871a68d62b7df5fe.jpg", "https://www.the-sun.com/wp-content/uploads/sites/6/2021/07/NINTCHDBPICT000611344585.jpg", "https://i.pinimg.com/474x/a1/38/c2/a138c23356a4c3e3cb15ed43b851479b.jpg"],
  ["http://images6.fanpop.com/image/photos/32400000/Jason-Bell-Photoshoot-marisa-tomei-32428343-2000-2056.jpg", "https://saucemonsters.com/wp-content/uploads/2017/07/Marisa-Tomei-08.jpg", "https://i1.wp.com/comicbooksgalaxy.com/wp-content/uploads/2019/08/marisa-tomei-bikini.jpg?resize=696%2C931&ssl=1"],
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
counter = 1
photo_array_counter = 0
15.times do
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
end
puts "female users created"

# create swipes
puts "creating swipes for matches"
swipee_counter = 2
6.times do
  Swipe.create(
    islike: true,
    swipee_id: swipee_counter,
    swiper_id: 1
  )
  swipee_counter += 1
end

swiper_match_counter = 8
5.times do
  Swipe.create(
    islike: true,
    swipee_id: 1,
    swiper_id: swiper_match_counter
  )
  swiper_match_counter += 1
end
puts "swipes created"

# create matches
# puts "creating matches from swipes"
# swipe_counter = 1
# 3.times do
#   Match.create(
#     swipe_id: swipe_counter
#   )
#   swipe_counter += 1
# end
# puts "matches created"
