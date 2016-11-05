class CreateArchivedEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :archived_employees do |t|

      t.timestamps
    end
  end
end
