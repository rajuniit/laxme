class CreateCceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :cce_reports do |t|

      t.timestamps
    end
  end
end
