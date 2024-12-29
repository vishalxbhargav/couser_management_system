class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.decimal :price

      t.timestamps
    end
  end
end
