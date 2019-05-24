puts 'Cleaning database...'
User.destroy_all

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
    admin: false
  },
  {
    email: "julian@gmail.com",
    first_name: "Julian",
    last_name: "Dicks",
    password: "123456",
    password_confirmation: "123456",
    approver: false,
    author: true,
    admin: false
  },
  {
    email: "mark@gmail.com",
    first_name: "Mark",
    last_name: "Noble",
    password: "123456",
    password_confirmation: "123456",
    approver: false,
    author: false,
    admin: true
  },
  {
    email: "bobby@gmail.com",
    first_name: "Bobby",
    last_name: "Zamora",
    password: "123456",
    password_confirmation: "123456",
    approver: false,
    author: false,
    admin: false
  }
]

User.create!(users_attributes)
puts "Users created"
puts 'Finished!'
