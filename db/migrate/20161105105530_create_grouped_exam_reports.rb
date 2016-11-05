class CreateGroupedExamReports < ActiveRecord::Migration[5.0]
  def change
    create_table :grouped_exam_reports do |t|

      t.timestamps
    end
  end
end
