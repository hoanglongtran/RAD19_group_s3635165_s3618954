class CategoriesCourses < ActiveRecord::Migration[5.2]
  def change
	create_table :categories_courses, :id => false do |t|
		t.integer :course_id
		t.integer :category_id
	end
  end
end
