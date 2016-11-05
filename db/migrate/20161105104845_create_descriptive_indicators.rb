class CreateDescriptiveIndicators < ActiveRecord::Migration[5.0]
  def change
    create_table :descriptive_indicators do |t|

      t.timestamps
    end
  end
end
