class CreateFinanceLiabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_liabilities do |t|

      t.timestamps
    end
  end
end
