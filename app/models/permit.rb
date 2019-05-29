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
end
