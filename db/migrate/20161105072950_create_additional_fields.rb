class CreateAdditionalFields < ActiveRecord::Migration[5.0]
  def change
    create_table :additional_fields do |t|

      t.timestamps
    end
  end
end
