class CreateSmsSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :sms_settings do |t|

      t.timestamps
    end
  end
end
