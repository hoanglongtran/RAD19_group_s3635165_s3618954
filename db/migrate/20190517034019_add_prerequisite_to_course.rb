class AddPrerequisiteToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :prerequisite, :string
  end
end
