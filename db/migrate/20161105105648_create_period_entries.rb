class CreatePeriodEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :period_entries do |t|

      t.timestamps
    end
  end
end
