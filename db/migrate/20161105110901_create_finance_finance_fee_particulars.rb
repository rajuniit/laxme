class CreateFinanceFinanceFeeParticulars < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_finance_fee_particulars do |t|

      t.timestamps
    end
  end
end
