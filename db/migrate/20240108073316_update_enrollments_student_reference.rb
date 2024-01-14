class UpdateEnrollmentsStudentReference < ActiveRecord::Migration[7.1]
  def change
    # Remove the existing foreign key
    remove_foreign_key :enrollments, :students

    # Add a new foreign key reference to students table
    add_foreign_key :enrollments, :students, column: :student_id, primary_key: :user_id, on_delete: :cascade
  end
end
