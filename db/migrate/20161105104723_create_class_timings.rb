class CreateClassTimings < ActiveRecord::Migration[5.0]
  def change
    create_table :class_timings do |t|

      t.timestamps
    end
  end
end
