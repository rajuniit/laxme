class CreateFedenaMailers < ActiveRecord::Migration[5.0]
  def change
    create_table :fedena_mailers do |t|

      t.timestamps
    end
  end
end
