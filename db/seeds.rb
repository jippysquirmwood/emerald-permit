puts 'Cleaning database...'
User.destroy_all
Permit.destroy_all
puts 'Creating users...'
users_attributes = [
  {
    email: "paulo@gmail.com",
    first_name: "Paulo",
    last_name: "Di canio",
    password: "123456",
    password_confirmation: "123456",
    approver: true,
    author: false,
    admin: false,
    avatar: "https://gq-images.condecdn.net/image/BXglzJm1l7p/crop/1020/f/Paolo-Di-Canio-West-Ham-GQ-16Sep16_pa_b.jpg"
  },
  {
    email: "julian@gmail.com",
    first_name: "Julian",
    last_name: "Dicks",
    password: "123456",
    password_confirmation: "123456",
    approver: false,
    author: true,
    admin: false,
    avatar: "https://premierleague-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/p16129.png"
  },
  {
    email: "mark@gmail.com",
    first_name: "Mark",
    last_name: "Noble",
    password: "123456",
    password_confirmation: "123456",
    approver: false,
    author: false,
    admin: true,
    avatar: "https://www.telegraph.co.uk/content/dam/football/2016/09/25/109565018_noble_sport_trans_NvBQzQNjv4Bq90JsMauqkzRhOnTEP_rlOlOLxaasDc9KXcXbtqPGl_Y.jpg?imwidth=450"
  },
  {
    email: "bobby@gmail.com",
    first_name: "Bobby",
    last_name: "Zamora",
    password: "123456",
    password_confirmation: "123456",
    approver: false,
    author: false,
    admin: false,
    avatar: "https://cdn.hitc-s.com/i/473/reuters_picture_supplied_by_action_images_local_caption_rbborh20_349963.jpg"
  }
]

User.create!(users_attributes)
puts "Users created"
puts 'Finished!'
