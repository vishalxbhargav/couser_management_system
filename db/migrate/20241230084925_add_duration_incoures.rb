class AddDurationIncoures < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :duration, :integer
  end
end
