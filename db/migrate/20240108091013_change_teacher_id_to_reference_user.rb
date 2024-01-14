class ChangeTeacherIdToReferenceUser < ActiveRecord::Migration[7.1]
  def change
    # # Remove the existing foreign key
    # remove_foreign_key :courses, :teachers

    # Add a new foreign key reference to teachers table
    add_foreign_key :courses, :teachers, column: :teacher_id, primary_key: :user_id, on_delete: :cascade
  end
end
