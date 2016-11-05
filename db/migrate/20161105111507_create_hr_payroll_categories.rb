class CreateHrPayrollCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_payroll_categories do |t|

      t.timestamps
    end
  end
end
