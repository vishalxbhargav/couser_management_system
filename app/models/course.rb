class Course < ApplicationRecord
  before_destroy :ensure_admin

  has_many :enrollments
  has_many :users, through: :enrollments

  validates :course_name, uniqueness: true, presence: true
  validates :price, numericality: true

  def is_admin
    p "if user is admin then delete the course"
  end
end
