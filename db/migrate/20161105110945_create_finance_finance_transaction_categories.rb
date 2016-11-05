class CreateFinanceFinanceTransactionCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_finance_transaction_categories do |t|

      t.timestamps
    end
  end
end
