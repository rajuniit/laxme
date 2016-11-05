class CreateClassDesignations < ActiveRecord::Migration[5.0]
  def change
    create_table :class_designations do |t|

      t.timestamps
    end
  end
end
