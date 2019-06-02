class Permit < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :approver, class_name: "User", optional: true

  include PgSearch
  multisearchable against: [:location, :level, :permit_number, :method_statement, :title, :author_last_name, :author_first_name, :approver_first_name, :approver_last_name, :author_email, :approver_email]

  def perm_statuses
    statuses = [
      "draft",
      "pending approval",
      "rejected",
      "approved",
      "expired"
    ]
    statuses
  end

  def perm_types
    permit_types = [
      "permit to dig",
      "permit to drill",
      "permit to work at height",
      "permit to load",
      "confined space permit",
      "hot work permit"
    ]
    permit_types
  end

  def approver_first_name
    approver.present? ? approver.first_name : ""
  end

  def approver_last_name
    approver.present? ? approver.last_name : ""
  end

  def author_last_name
    author.present? ? author.last_name : ""
  end

  def author_first_name
    author.present? ? author.first_name : ""
  end

  def approver_email
    approver.present? ? approver.email : ""
  end

  def author_email
    author.present? ? author.email : ""
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
    date.strftime("%-d-%-m-%y %H:%M")
  end

  def time(date)
    date.strftime("%H:%M")
  end

  def status_icon
    statuses = perm_statuses
    if status == statuses[0]
      icon = 'far fa-edit status-draft'
    elsif status == statuses[1]
      icon = 'far fa-clock status-pending'
    elsif status == statuses[2]
      icon = 'fas fa-times status-rejected'
    elsif status == statuses[3]
      icon = 'fas fa-check status-approved'
    elsif status == statuses[4]
      icon = 'fas fa-exclamation status-expired'
    end
    icon
  end

  def who_with
    statuses = perm_statuses
    if [statuses[0], statuses[2], statuses[3]].include?(status)
      with_who = author
    elsif status == statuses[1]
      with_who = approver
    else
      with_who = nil
    end
    with_who
  end
end
