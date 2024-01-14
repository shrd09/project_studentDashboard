class AddMarksToEnrollments < ActiveRecord::Migration[7.1]
  def change
    add_column :enrollments, :marks, :integer
  end
end
