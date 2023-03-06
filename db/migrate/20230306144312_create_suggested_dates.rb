class CreateSuggestedDates < ActiveRecord::Migration[7.0]
  def change
    create_table :suggested_dates do |t|
      t.time :time
      t.date :date
      t.references :date_location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
