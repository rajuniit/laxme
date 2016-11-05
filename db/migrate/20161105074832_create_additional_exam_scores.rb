class CreateAdditionalExamScores < ActiveRecord::Migration[5.0]
  def change
    create_table :additional_exam_scores do |t|

      t.timestamps
    end
  end
end
