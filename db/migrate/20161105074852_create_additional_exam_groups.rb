class CreateAdditionalExamGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :additional_exam_groups do |t|

      t.timestamps
    end
  end
end
