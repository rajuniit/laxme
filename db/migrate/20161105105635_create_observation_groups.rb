class CreateObservationGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :observation_groups do |t|

      t.timestamps
    end
  end
end
