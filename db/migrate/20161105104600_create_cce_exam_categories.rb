class CreateCceExamCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :cce_exam_categories do |t|

      t.timestamps
    end
  end
end
