class CreateHrBankFields < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_bank_fields do |t|

      t.timestamps
    end
  end
end
