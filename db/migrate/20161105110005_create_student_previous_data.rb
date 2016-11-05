class CreateStudentPreviousData < ActiveRecord::Migration[5.0]
  def change
    create_table :student_previous_data do |t|

      t.timestamps
    end
  end
end
