class CreateArchivedEmployeeBankDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :archived_employee_bank_details do |t|

      t.timestamps
    end
  end
end
