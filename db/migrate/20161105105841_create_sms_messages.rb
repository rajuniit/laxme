class CreateSmsMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :sms_messages do |t|

      t.timestamps
    end
  end
end
