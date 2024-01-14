class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true, unique: true
      t.string :student_name,null: false
      t.string :address
      t.integer :age

      t.timestamps
    end
  end
end
