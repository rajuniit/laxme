class CreateFinanceBatchFeeCollectionDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_batch_fee_collection_discounts do |t|

      t.timestamps
    end
  end
end
