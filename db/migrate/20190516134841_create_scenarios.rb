class CreateScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :scenarios do |t|
      t.string :scenario_name
      t.string :scenario_description

      t.timestamps
    end
  end
end
