class CreateHrEmployeeDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_employee_departments do |t|

      t.timestamps
    end
  end
end
