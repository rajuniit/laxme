class CreateHrMonthlyPayslips < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_monthly_payslips do |t|

      t.timestamps
    end
  end
end
