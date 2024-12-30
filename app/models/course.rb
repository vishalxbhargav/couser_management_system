class Course < ApplicationRecord
  before_destroy :ensure_admin

  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :reviews
  has_many :users, through: :reviews

  validates :course_name, uniqueness: true, presence: true
  validates :price, numericality: true
  # validates :duration, presence: true

  scope :active_course, -> { where(active: true) }
  scope :last_week, -> { where("created_at >=?", 7.days.ago) }
  scope :last_month, -> { where("created_at >=?", 1.month.ago.beginning_of_month).where("created_at <=?", 1.month.ago.end_of_month) }
  def is_admin
    p "if user is admin then delete the course"
  end
end
