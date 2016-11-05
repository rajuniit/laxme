class CreateFinanceAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_assets do |t|

      t.timestamps
    end
  end
end
