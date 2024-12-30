class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.decimal :rating, precision: 5, scale: 2
      t.belongs_to :course
      t.belongs_to :user
      t.timestamps
    end
  end
end
