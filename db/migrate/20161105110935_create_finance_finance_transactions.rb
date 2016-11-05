class CreateFinanceFinanceTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_finance_transactions do |t|

      t.timestamps
    end
  end
end
