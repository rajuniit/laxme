class CreateBatchGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :batch_groups do |t|

      t.timestamps
    end
  end
end
