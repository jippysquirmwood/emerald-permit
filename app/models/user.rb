class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authored_permits, class_name: "Permit", foreign_key: "author_id", dependent: :destroy
  has_many :approved_permits, class_name: "Permit", foreign_key: "approver_id", dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  include PgSearch
  multisearchable against: [:email, :first_name, :last_name, :role]

  def fullname
    first_name + " " + last_name
  end

  def short_first_name
    "#{first_name[0].capitalize}. #{last_name}"
  end

  def short_last_name
    "#{first_name.capitalize} #{last_name[0]}"
  end

  def initials
    "#{first_name[0].capitalize}#{last_name[0]}"
  end
end
