class CreateStudentPreviousSubjectMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :student_previous_subject_marks do |t|

      t.timestamps
    end
  end
end
