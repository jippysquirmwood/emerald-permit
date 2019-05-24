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
    avatar: "https://res.cloudinary.com/zachobbs/image/upload/v1558532976/gun_face_180622_hpMain_4x3_992_z2imdj.jpg"
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
    avatar: "https://res.cloudinary.com/zachobbs/image/upload/v1558532984/methode_2Ftimes_2Fprod_2Fweb_2Fbin_2Fa180333e-f0e1-11e8-8c84-29b2667b0b46_blfzcd.jpg"
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
    avatar: "https://res.cloudinary.com/zachobbs/image/upload/v1558532961/demo-pic4_gl82z5.jpg"
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
    avatar: "https://res.cloudinary.com/zachobbs/image/upload/v1558532962/screen-shot-2019-02-15-at-19-16-58-720x720_ohivk8.jpg"
  }
]

User.create!(users_attributes)
puts "Users created"
puts 'Finished!'
