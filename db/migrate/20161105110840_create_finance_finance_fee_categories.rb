class CreateFinanceFinanceFeeCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_finance_fee_categories do |t|

      t.timestamps
    end
  end
end
