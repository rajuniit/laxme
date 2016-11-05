class CreateElectiveGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :elective_groups do |t|

      t.timestamps
    end
  end
end
