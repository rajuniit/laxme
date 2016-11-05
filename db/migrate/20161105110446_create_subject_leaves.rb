class CreateSubjectLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_leaves do |t|

      t.timestamps
    end
  end
end
