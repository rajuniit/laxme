class CreateStudentAdditionalDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :student_additional_details do |t|

      t.timestamps
    end
  end
end
