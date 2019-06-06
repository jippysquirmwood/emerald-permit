require 'faker'

roles = [
  {
    name: "Site Administrator",
    permissions: {
      approver: true,
      author: true,
      admin: true,
    }
  },
  {
    name: "Project Manager",
    permissions: {
      approver: true,
      author: true,
      admin: false,
    }
  },
  {
    name: "Agent",
    permissions: {
      approver: true,
      author: true,
      admin: false,
    }
  },
  {
    name: "Sub Agent",
    permissions: {
      approver: false,
      author: true,
      admin: false,
    }
  },
  {
    name: "Section Engineer",
    permissions: {
      approver: false,
      author: true,
      admin: false,
    }
  },
  {
    name: "Site Engineer",
    permissions: {
      approver: false,
      author: true,
      admin: false,
    }
  },
  {
    name: "Site Supervisor",
    permissions: {
      approver: false,
      author: false,
      admin: false,
    }
  },
  {
    name: "Site Personnel",
    permissions: {
      approver: false,
      author: false,
      admin: false,
    }
  }
]

puts 'Cleaning database...'
User.destroy_all
Permit.destroy_all
puts 'Creating first 4 users...'
users_attributes = [
  {
    email: "anthony.wildman@emerald.com",
    first_name: "anthony",
    last_name: "wildman",
    password: "123456",
    password_confirmation: "123456",
    role: "Project Manager",
    phone: "07926836172",
    approver: true,
    author: false,
    admin: false,
    avatar: "https://pbs.twimg.com/media/D8X-XY5XoAEe1Fv.jpg:large"
  },
  {
    email: "jonathan.reid@emerald.com",
    first_name: "jonathan",
    last_name: "reid",
    password: "123456",
    password_confirmation: "123456",
    role: "Site Engineer",
    phone: "07961442946",
    approver: false,
    author: true,
    admin: false,
    avatar: "https://laminarprojects.com/wp-content/uploads/2019/03/Jonathan-Reid-1200x1094.jpg"
  },
  {
    email: "zac.hobbs@emerald.com",
    first_name: "Mark",
    last_name: "Noble",
    password: "123456",
    password_confirmation: "123456",
    role: "Site Personnel",
    phone: "07785423661",
    approver: false,
    author: false,
    admin: true,
    avatar: "https://avatars2.githubusercontent.com/u/45005021?v=4"
  },
  {
    email: "fred.jonquiers@emerald.com",
    first_name: "fred",
    last_name: "jonquiers",
    password: "123456",
    password_confirmation: "123456",
    role: "Site Personnel",
    phone: "07981673400",
    approver: false,
    author: false,
    admin: false,
    avatar: "https://avatars2.githubusercontent.com/u/47979498?v=4"
  },
  {
    email: "rod.davis@emerald.com",
    first_name: "rod",
    last_name: "davis",
    password: "123456",
    password_confirmation: "123456",
    role: "Site Supervisor",
    phone: "07981673400",
    approver: false,
    author: false,
    admin: false,
    avatar: "https://laminarprojects.com/wp-content/uploads/2019/03/David-Nash-1200x1094.jpg"
  },
  {
    email: "david.nash@emerald.com",
    first_name: "david",
    last_name: "nash",
    password: "123456",
    password_confirmation: "123456",
    role: "Site Personnel",
    phone: "07981673400",
    approver: false,
    author: false,
    admin: false,
    avatar: "https://laminarprojects.com/wp-content/uploads/2019/03/David-Nash-1200x1094.jpg"
  },
  {
    email: "javier.zamorano@emerald.com",
    first_name: "javier",
    last_name: "zamorano",
    password: "123456",
    password_confirmation: "123456",
    role: "Site Personnel",
    phone: "07981673400",
    approver: false,
    author: false,
    admin: false,
    avatar: "https://laminarprojects.com/wp-content/uploads/2019/04/Javier-Zamorano.jpg"
  },
  {
    email: "mathew.briggs@emerald.com",
    first_name: "mathew",
    last_name: "briggs",
    password: "123456",
    password_confirmation: "123456",
    role: "Site Personnel",
    phone: "07981673400",
    approver: false,
    author: false,
    admin: false,
    avatar: "https://laminarprojects.com/wp-content/uploads/2019/03/Mat-Briggs-1200x1201.jpg"
  },
  {
    email: "jim.ramirez@emerald.com",
    first_name: "jim",
    last_name: "ramirez",
    password: "123456",
    password_confirmation: "123456",
    role: "Site Personnel",
    phone: "07981673400",
    approver: false,
    author: false,
    admin: false,
    avatar: "https://laminarprojects.com/wp-content/uploads/2019/03/Pablo-Arguelles-1200x1094.jpg"
  }
]

User.create!(users_attributes)
puts "First 4 Users created"

puts "Creating 30 random users"
roles.each do |role|
  puts "creating 5 #{role[:name]}s"
  5.times do
    User.create!(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: "123456",
      password_confirmation: "123456",
      role: role[:name],
      phone: "07#{Faker::PhoneNumber.subscriber_number(9)}",
      approver: role[:permissions][:approver],
      author: role[:permissions][:author],
      admin: role[:permissions][:admin],
      avatar: "https://source.unsplash.com/featured/?face"
  )
  end
end
puts "30 random users created!"


statuses = ["draft", "rejected", "pending approval", "approved", "expired"]
permit_types = ["permit to dig", "permit to drill", "permit to work at height", "permit to load", "confined space permit", "hot work permit"]
levels = ["B02 - Basement 2", "B01 - Basement 1", "G01 - Ground", "L01 - Level 1", "L02 - Level 2", "L03 - Level 3", "R01 - Roof"]
locations = ["west corridor", "toilet block", "staff accommodation room", "lobby", "drainage culvert"]
project_id = "P257-COT"
permit_numbers = (10..90).step(10).to_a
booleans = [true, false]
cat_models = ["C.A.T4", "C.A.T4+", "eC.A.T4", "eC.A.T4+", "gC.A.T4", "gC.A.T4+", nil]
genny_models = ["Genny4", nil]
titles = ["Trench for culvert 12B", "Drill out column footings", "Northern Abutment batter trim", "Southern Abutment batter trim", "Trial Dig", "SIGI sitewide", "Topsoil Strip", "Cut to fill from Borrow Pit C", "Rock breaking in Cut A"]

puts 'Creating Random permits...'
100.times do
  Permit.create!(
    {
      status: statuses.sample,
      start_date: (Time.now().beginning_of_day + rand(10).day + 9.hours).to_datetime,
      end_date: (Time.now().beginning_of_day + (10 + rand(5)).day + 18.hours).to_datetime,
      permit_type: permit_types.sample,
      level: rand < 0.5 ? levels[2] : levels.sample,
      location: locations.sample,
      project_id: project_id,
      permit_number: project_id + "-CIV-PERM-00" + permit_numbers.sample.to_s + rand(9).to_s,
      method_statement: project_id + "-WPP-CS-000462/493",
      xwidth: (0..10000).step(25).to_a.sample,
      xlength: (0.5..50.0).step(0.1).to_a.sample.to_i,
      xdepth: (0..10000).step(25).to_a.sample.to_i,
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
      calibration_expires: Time.now().beginning_of_day + 180.day,
      cat_scanner_serial: "AR003BYARDFD-D93485839394",
      genny_serial: "FD-D93AR003BYARD485839394",
      author_id: User.where(author: true).where.not(email: "jonathan.reid@emerald.com").sample.id,
      approver_id: User.where(approver: true).where.not(email: "anthony.wildman@emerald.com").sample.id,
      title: titles.sample
    }
  )
end
puts "Random Permits created"

puts "Creating Jono's permits"
presentation_time = Date.new(2019, 6, 6) + 16.hours
# presentation_time = Time.now.to_datetime + 1.hours
Permit.create!(
  {
    status: "expired",
    start_date: presentation_time - 3.day,
    end_date: presentation_time - 1.day + 11.hours,
    permit_type: "permit to dig",
    level: "G01 - Ground",
    location: "Grid 2, Culvert 2C",
    project_id: project_id,
    permit_number: project_id + "-CIV-PERM-00" + permit_numbers.sample.to_s + rand(9).to_s,
    method_statement: project_id + "-WPP-CS-000462/493",
    xwidth: 600,
    xlength: 12,
    xdepth: 1500,
    gas: true,
    fibre_optic: false,
    water: false,
    unknown: false,
    hv_electricity: true,
    bt: true,
    traffic_signal: false,
    signal_cable: false,
    lv_electricity: false,
    drains: false,
    street_lighting: true,
    no_services: false,
    hand_digging: true,
    confirm_work_package_plan: true,
    confirm_machine_operator: false,
    services_protected: true,
    exlusion_zone: true,
    buried_cables_identified: true,
    drawing_updated: true,
    physical_barrier_available: false,
    excavation_undermining_foundations: false,
    cat_scan_model: cat_models.sample,
    genny_model: genny_models.sample,
    calibration_expires: Time.now().beginning_of_day + 180.day,
    cat_scanner_serial: "AR003BYARDFD-D93485839394",
    genny_serial: "FD-D93AR003BYARD485839394",
    cat_genny_operator: User.where(email: "rod.davis@emerald.com")[0].fullname,
    author_id: User.where(email: "jonathan.reid@emerald.com")[0].id,
    approver_id: User.where(email: "anthony.wildman@emerald.com")[0].id,
    title: "Trial holes for culvert 2C",
    works_description: "4 holes at 3m spacing as marked by surveyor",
    hand_diggin_text: "no machine digging within 500mm of electrical services"
  }
)

Permit.create!(
  {
    status: "approved",
    start_date: presentation_time - 1.day,
    end_date: presentation_time + 30.minutes,
    permit_type: "permit to dig",
    level: "G01 - Ground",
    location: "Grid 4, manhole MH-2",
    project_id: project_id,
    permit_number: project_id + "-CIV-PERM-00" + permit_numbers.sample.to_s + rand(9).to_s,
    method_statement: project_id + "-WPP-CS-000462/496",
    xwidth: 5000,
    xlength: 5,
    xdepth: 4000,
    gas: true,
    fibre_optic: false,
    water: true,
    unknown: false,
    hv_electricity: true,
    bt: true,
    traffic_signal: false,
    signal_cable: true,
    lv_electricity: true,
    drains: true,
    street_lighting: false,
    no_services: false,
    hand_digging: true,
    confirm_work_package_plan: true,
    confirm_machine_operator: true,
    services_protected: true,
    exlusion_zone: true,
    buried_cables_identified: true,
    drawing_updated: true,
    physical_barrier_available: true,
    excavation_undermining_foundations: true,
    cat_scan_model: cat_models.sample,
    genny_model: genny_models.sample,
    calibration_expires: Time.now.beginning_of_day + 180.day,
    cat_scanner_serial: "AR003BYARDFD-D93485839394",
    genny_serial: "FD-D93AR003BYARD485839394",
    cat_genny_operator: User.where(email: "rod.davis@emerald.com")[0].fullname,
    author_id: User.where(email: "jonathan.reid@emerald.com")[0].id,
    approver_id: User.where(email: "anthony.wildman@emerald.com")[0].id,
    title: "Excavate Manhole MH-2",
    works_description: "Excavate with CAT 320 Excavator within sheet pile protected excavation. propping as per Temporary Works Design",
    hand_diggin_text: "only hand digging is permitted within 500mm of electrical services",
    site_layout_img: "site_layout_mh2.svg"
  }
)

Permit.create!(
  {
    status: "draft",
    start_date: presentation_time + 2.hours,
    end_date: presentation_time + 24.hours,
    permit_type: "permit to dig",
    level: "G01 - Ground",
    location: "Grid 2, Culvert 2C",
    project_id: project_id,
    permit_number: project_id + "-CIV-PERM-00" + permit_numbers.sample.to_s + rand(9).to_s,
    method_statement: project_id + "-WPP-CS-000462/493",
    xwidth: 600,
    xlength: 12,
    xdepth: 1500,
    gas: true,
    fibre_optic: true,
    water: false,
    unknown: false,
    hv_electricity: false,
    bt: true,
    traffic_signal: false,
    signal_cable: false,
    lv_electricity: true,
    drains: true,
    street_lighting: true,
    no_services: false,
    hand_digging: true,
    confirm_work_package_plan: true,
    confirm_machine_operator: false,
    services_protected: true,
    exlusion_zone: true,
    buried_cables_identified: true,
    drawing_updated: true,
    physical_barrier_available: false,
    excavation_undermining_foundations: false,
    cat_scan_model: cat_models.sample,
    genny_model: genny_models.sample,
    calibration_expires: Time.now().beginning_of_day + 180.day,
    cat_scanner_serial: "AR003BYARDFD-D93485839394",
    genny_serial: "FD-D93AR003BYARD485839394",
    cat_genny_operator: User.where(email: "rod.davis@emerald.com")[0].fullname,
    author_id: User.where(email: "jonathan.reid@emerald.com")[0].id,
    approver_id: User.where(email: "anthony.wildman@emerald.com")[0].id,
    title: "Excavate trench for Culvert 2C - Box culvert drain",
    works_description: "Excavate to underside of bedding level. Excavation to be benched above 1.2m",
    hand_diggin_text: "no machine digging within 500mm of electrical services",
    site_layout_img: "site_layout_culvert_16c.svg"
  }
)

Permit.create!(
  {
    status: "draft",
    start_date: presentation_time + 3.day + 16.hours,
    end_date: presentation_time + 8.day,
    permit_type: "permit to dig",
    level: "G01 - Ground",
    location: "Grid 17, manhole MH-1",
    project_id: project_id,
    permit_number: project_id + "-CIV-PERM-00" + permit_numbers.sample.to_s + rand(9).to_s,
    method_statement: project_id + "-WPP-CS-000462/496",
    xwidth: 600,
    xlength: 12,
    xdepth: 1500,
    gas: true,
    fibre_optic: false,
    water: false,
    unknown: false,
    hv_electricity: true,
    bt: true,
    traffic_signal: false,
    signal_cable: false,
    lv_electricity: false,
    drains: false,
    street_lighting: true,
    no_services: false,
    hand_digging: true,
    confirm_work_package_plan: true,
    confirm_machine_operator: false,
    services_protected: true,
    exlusion_zone: true,
    buried_cables_identified: true,
    drawing_updated: true,
    physical_barrier_available: false,
    excavation_undermining_foundations: false,
    cat_scan_model: cat_models.sample,
    genny_model: genny_models.sample,
    calibration_expires: Time.now().beginning_of_day + 180.day,
    cat_scanner_serial: "AR003BYARDFD-D93485839394",
    genny_serial: "FD-D93AR003BYARD485839394",
    cat_genny_operator: User.where(email: "rod.davis@emerald.com")[0].fullname,
    author_id: User.where(email: "jonathan.reid@emerald.com")[0].id,
    approver_id: User.where(email: "anthony.wildman@emerald.com")[0].id,
    title: "Excavate Manhole MH-1",
    works_description: "Excavate with CAT 320 Excavator within sheet pile protected excavation. propping as per Temporary Works Design",
    hand_diggin_text: "no machine digging within 500mm of electrical services",
    site_layout_img: "site_layout_mh1.svg"
  }
)

puts 'Finished!'
