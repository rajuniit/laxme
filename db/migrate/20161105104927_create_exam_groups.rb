class CreateExamGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_groups do |t|

      t.timestamps
    end
  end
end
