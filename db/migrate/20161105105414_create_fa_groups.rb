class CreateFaGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :fa_groups do |t|

      t.timestamps
    end
  end
end
