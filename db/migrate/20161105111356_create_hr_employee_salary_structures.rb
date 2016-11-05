class CreateHrEmployeeSalaryStructures < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_employee_salary_structures do |t|

      t.timestamps
    end
  end
end
