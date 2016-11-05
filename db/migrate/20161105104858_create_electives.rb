class CreateElectives < ActiveRecord::Migration[5.0]
  def change
    create_table :electives do |t|

      t.timestamps
    end
  end
end
