class CreateFinanceFinanceTransactionTriggers < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_finance_transaction_triggers do |t|

      t.timestamps
    end
  end
end
