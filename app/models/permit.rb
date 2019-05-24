class Permit < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :approver, class_name: "User", optional: true
end
