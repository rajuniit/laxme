class CreateStudentCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :student_categories do |t|

      t.timestamps
    end
  end
end
