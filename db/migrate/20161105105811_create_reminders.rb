class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|

      t.timestamps
    end
  end
end
