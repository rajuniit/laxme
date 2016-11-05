class CreateGuardians < ActiveRecord::Migration[5.0]
  def change
    create_table :guardians do |t|

      t.timestamps
    end
  end
end
