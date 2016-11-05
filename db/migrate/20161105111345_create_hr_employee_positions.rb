class CreateHrEmployeePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_employee_positions do |t|

      t.timestamps
    end
  end
end
