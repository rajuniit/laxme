class CreateHrIndividualPayslipCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_individual_payslip_categories do |t|

      t.timestamps
    end
  end
end
