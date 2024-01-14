class ChangePhoneNoDataTypeInTeachers < ActiveRecord::Migration[7.1]
  def change
    change_column :teachers, :phone_no, :string
  end
end
