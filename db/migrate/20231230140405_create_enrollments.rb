class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.references :student, null: false, foreign_key: {to_table: :users}
      t.references :course, null: false, foreign_key: true
      t.integers :marks,default:0

      t.timestamps
    end
  end
end
