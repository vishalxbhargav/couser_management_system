class CreateEnrollments < ActiveRecord::Migration[8.0]
  def change
    create_table :enrollments do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
