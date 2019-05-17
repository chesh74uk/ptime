class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.string :event_outcome
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
