class CreateFinanceFinanceFeeStructureElements < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_finance_fee_structure_elements do |t|

      t.timestamps
    end
  end
end
