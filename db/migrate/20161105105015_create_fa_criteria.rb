class CreateFaCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :fa_criteria do |t|

      t.timestamps
    end
  end
end
