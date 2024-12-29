class User < ApplicationRecord
  has_many :enrollments
  has_many :courses, through: :enrollments

  enum :role, [ :student, :admin ]

  validates :username, uniqueness: { message: "Username already exists" }, presence: true,
            format: { with: /\A[A-Za-z]+\z/, message: "Only allows letters" },
            length: { minimum: 6 }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  validates_each :first_name, :last_name do |record, attr, value|
    if value.present? && /\A[[:lower:]]/.match?(value)
      record.errors.add(attr, "must start with an uppercase letter")
    end
  end
end
