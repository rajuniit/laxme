class CreateGroupedBatches < ActiveRecord::Migration[5.0]
  def change
    create_table :grouped_batches do |t|

      t.timestamps
    end
  end
end
