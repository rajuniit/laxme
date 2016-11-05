class CreateFinanceFeeCollectionParticulars < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_fee_collection_particulars do |t|

      t.timestamps
    end
  end
end
