class CreateSchoolDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :school_details do |t|

      t.timestamps
    end
  end
end
