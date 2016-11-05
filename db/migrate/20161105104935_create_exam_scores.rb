class CreateExamScores < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_scores do |t|

      t.timestamps
    end
  end
end
