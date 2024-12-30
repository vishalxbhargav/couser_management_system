class AddStatusColumnInCourse < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :active, :boolean, default: true
  end
end
