class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum :status, [ :enrolled, :cancelled, :dropped, :completed ]
end
