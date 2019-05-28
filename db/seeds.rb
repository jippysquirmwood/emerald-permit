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

statuses = ["draft", "rejected", "pending approval", "approved", "expired"]
permit_types = ["permit to dig", "permit to drill", "permit to penetrate", "permit to work at height", "permit to load", "confined space permit"]
levels = ["B02 - Basement 2", "B01 - Basement 1", "G01 - Ground", "L01 - Level 1", "L02 - Level 2", "L03 - Level 3", "R01 - Roof"]
locations = ["west corridor", "toilet block", "staff accommodation room", "lobby", "drainage culvert"]
project_id = "P257-COT"
permit_numbers = (10..90).step(10).to_a
booleans = [true, false]
cat_models = ["C.A.T4", "C.A.T4+", "eC.A.T4", "eC.A.T4+", "gC.A.T4", "gC.A.T4+", nil]
genny_models = ["Genny4", nil]
titles = ["Trench for culvert 12B", "Drill out column footings", "Northern Abutment batter trim", "Southern Abutment batter trim", "Trial Dig", "SIGI sitewide", "Topsoil Strip", "Cut to fill from Borrow Pit C", "Rock breaking in Cut A"]

puts 'Creating permits...'
100.times do
  Permit.create!(
    {
      status: statuses.sample,
      start_date: Time.now() + rand(10).day,
      end_date: Time.now() + (10 + rand(5)).day,
      permit_type: permit_types.sample,
      level: rand < 0.5 ? levels[2] : levels.sample,
      location: locations.sample,
      project_id: project_id,
      permit_number: project_id + "-CIV-PERM-00" + permit_numbers.sample.to_s + rand(9).to_s,
      method_statement: project_id + "-WPP-CS-000462/493",
      xwidth: (0..10000).step(25).to_a.sample,
      xlength: (0.5..50.0).step(0.1).to_a.sample,
      xdepth: (0..10000).step(25).to_a.sample,
      gas: booleans.sample,
      fibre_optic: booleans.sample,
      water: booleans.sample,
      unknown: false,
      hv_electricity: booleans.sample,
      bt: booleans.sample,
      traffic_signal: booleans.sample,
      signal_cable: booleans.sample,
      lv_electricity: booleans.sample,
      drains: booleans.sample,
      street_lighting: booleans.sample,
      no_services: false,
      hand_digging: booleans.sample,
      confirm_work_package_plan: booleans.sample,
      confirm_machine_operator: booleans.sample,
      services_protected: booleans.sample,
      exlusion_zone: booleans.sample,
      buried_cables_identified: booleans.sample,
      drawing_updated: booleans.sample,
      physical_barrier_available: booleans.sample,
      excavation_undermining_foundations: booleans.sample,
      cat_scan_model: cat_models.sample,
      genny_model: genny_models.sample,
      calibration_expires: Time.now() + 180.day,
      cat_scanner_serial: "AR003BYARDFD-D93485839394",
      genny_serial: "FD-D93AR003BYARD485839394",
      author_id: User.where(author: true).sample.id,
      approver_id: User.where(approver: true).sample.id,
      title: titles.sample
    }
  )
end
puts "Permits created"
puts 'Finished!'
