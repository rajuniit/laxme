class CreateFinanceFinanceFees < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_finance_fees do |t|

      t.timestamps
    end
  end
end
