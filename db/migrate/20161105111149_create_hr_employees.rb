class CreateHrEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_employees do |t|

      t.timestamps
    end
  end
end
