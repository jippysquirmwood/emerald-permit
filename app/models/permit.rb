class Permit < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :approver, class_name: "User", optional: true

  include PgSearch
  multisearchable against: [:location, :level, :permit_number, :method_statement, :title, :author_last_name, :author_first_name, :approver_first_name, :approver_last_name, :author_email, :approver_email]

  def approver_first_name
    approver.first_name
  end

  def approver_last_name
    approver.last_name
  end

  def author_last_name
    author.last_name
  end

  def author_first_name
    author.first_name
  end

  def approver_email
    approver.email
  end

  def author_email
    author.email
  end

  def permit_type_img
    if permit_type == "permit to dig"
      img_url = "dig.png"
    elsif permit_type == "permit to drill"
      img_url = "drill.png"
    elsif permit_type == "permit to work at height"
      img_url = "work_at_height.png"
    elsif permit_type == "permit to load"
      img_url = "load.png"
    elsif permit_type == "confined space permit"
      img_url = "confined_space.jpg"
    elsif permit_type == "hot work permit"
      img_url = "hot_works.png"
    else
      img_url = "logo-emerald-lrg-bright.png"
    end
    img_url
  end

  def short_date(date)
     date.strftime("%e %b %y")
  end

  def date_time(date)
    date.strftime("%-d-%m-%y %H:%M")
  end

  def time(date)
    date.strftime("%H:%M")
  end
end
