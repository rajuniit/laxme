class CreateHrEmployeeBankDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_employee_bank_details do |t|

      t.timestamps
    end
  end
end
