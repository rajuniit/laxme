class CreateHrEmployeesSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_employees_subjects do |t|

      t.timestamps
    end
  end
end
