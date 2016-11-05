class CreateHrEmployeeDepartmentEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_employee_department_events do |t|

      t.timestamps
    end
  end
end
