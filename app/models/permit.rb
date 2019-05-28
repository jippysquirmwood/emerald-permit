class Permit < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :approver, class_name: "User", optional: true

  include PgSearch
  multisearchable against: [:location, :level, :permit_number, :method_statement, :title]
end
