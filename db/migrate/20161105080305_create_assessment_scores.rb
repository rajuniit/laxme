class CreateAssessmentScores < ActiveRecord::Migration[5.0]
  def change
    create_table :assessment_scores do |t|

      t.timestamps
    end
  end
end
