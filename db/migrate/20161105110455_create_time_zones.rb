class CreateTimeZones < ActiveRecord::Migration[5.0]
  def change
    create_table :time_zones do |t|

      t.timestamps
    end
  end
end
