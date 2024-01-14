class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :teacher_name, null: false
      t.string :phone_no

      t.timestamps
    end
  end
end
