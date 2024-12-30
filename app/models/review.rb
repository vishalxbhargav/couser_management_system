class Review < ApplicationRecord
  before_create :valid_entry
  belongs_to :user
  belongs_to :course

  validates :content, presence: true
  validates :rating, presence: true, numericality: true


  scope :last_week, -> { where("created_at >= ?", 7.days.ago).where }

  def valid_entry
    data=Enrollment.where(course_id: self.course_id).where(user_id: self.user_id)
    if data.empty?
      errors.add("user not enrolled in given course id")
      throw :abort
    end
  end
end
