class CreateCceGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :cce_grades do |t|

      t.timestamps
    end
  end
end
