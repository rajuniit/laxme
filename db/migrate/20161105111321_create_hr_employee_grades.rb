class CreateHrEmployeeGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_employee_grades do |t|

      t.timestamps
    end
  end
end