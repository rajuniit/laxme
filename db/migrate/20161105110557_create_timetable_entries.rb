class CreateTimetableEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :timetable_entries do |t|

      t.timestamps
    end
  end
end
