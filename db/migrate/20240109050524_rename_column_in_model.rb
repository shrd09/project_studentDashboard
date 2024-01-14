class RenameColumnInModel < ActiveRecord::Migration[7.1]
  def change
    rename_column :enrollments, :student_id, :user_id
  end
end
