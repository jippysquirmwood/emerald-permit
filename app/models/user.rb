class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authored_permits, class_name: "Permit", foreign_key: "author_id"
  has_many :approved_permits, class_name: "Permit", foreign_key: "approver_id"
end
