class CreateNewsComments < ActiveRecord::Migration[5.0]
  def change
    create_table :news_comments do |t|

      t.timestamps
    end
  end
end