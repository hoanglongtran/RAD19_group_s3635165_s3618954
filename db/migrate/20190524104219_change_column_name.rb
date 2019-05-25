class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :desc, :description
  end
end
