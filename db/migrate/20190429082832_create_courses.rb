class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :location, foreign_key: true
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.references :prerequisite, foreign_key: true

      t.timestamps
    end
  end
end
