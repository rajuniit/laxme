class CreateArchivedEmployeeSalaryStructures < ActiveRecord::Migration[5.0]
  def change
    create_table :archived_employee_salary_structures do |t|

      t.timestamps
    end
  end
end
