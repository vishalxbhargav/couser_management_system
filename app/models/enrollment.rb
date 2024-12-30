class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum :status, [ :enrolled, :cancelled, :dropped, :completed ]

  scope :last_week, -> { where("created_at >=?", 7.days.ago) }
  scope :last_month, -> { where("created_at >=?", 1.month.ago.beginning_of_month).where("created_at <=?", 1.month.ago.end_of_month) }
end
