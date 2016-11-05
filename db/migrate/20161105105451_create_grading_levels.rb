class CreateGradingLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :grading_levels do |t|

      t.timestamps
    end
  end
end
