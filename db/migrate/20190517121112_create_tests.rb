class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :test_customer
      t.string :test_scenario

      t.timestamps
    end
  end
end
