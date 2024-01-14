class AddUniqueConstraintToStudents < ActiveRecord::Migration[7.1]
  def change
    add_index :students, :user_id, unique: true
  end
end
