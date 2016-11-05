class CreateArchivedStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :archived_students do |t|

      t.timestamps
    end
  end
end
