class CreatePreviousExamScores < ActiveRecord::Migration[5.0]
  def change
    create_table :previous_exam_scores do |t|

      t.timestamps
    end
  end
end
