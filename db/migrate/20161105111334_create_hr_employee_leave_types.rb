class CreateHrEmployeeLeaveTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_employee_leave_types do |t|

      t.timestamps
    end
  end
end
