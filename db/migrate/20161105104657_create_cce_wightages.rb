class CreateCceWightages < ActiveRecord::Migration[5.0]
  def change
    create_table :cce_wightages do |t|

      t.timestamps
    end
  end
end
