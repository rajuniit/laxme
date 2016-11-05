class CreateCceGradeSets < ActiveRecord::Migration[5.0]
  def change
    create_table :cce_grade_sets do |t|

      t.timestamps
    end
  end
end
