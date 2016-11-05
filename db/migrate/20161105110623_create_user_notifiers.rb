class CreateUserNotifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_notifiers do |t|

      t.timestamps
    end
  end
end
