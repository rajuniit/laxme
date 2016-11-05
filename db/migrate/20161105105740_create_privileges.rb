class CreatePrivileges < ActiveRecord::Migration[5.0]
  def change
    create_table :privileges do |t|

      t.timestamps
    end
  end
end
