class CreateBatchEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :batch_events do |t|

      t.timestamps
    end
  end
end
