class CreateWeekdays < ActiveRecord::Migration[5.0]
  def change
    create_table :weekdays do |t|

      t.timestamps
    end
  end
end
