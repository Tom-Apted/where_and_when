class ChangeTimeToBeStringInSuggestedDate < ActiveRecord::Migration[7.0]
  def change
    change_column :suggested_dates, :time, :string
    change_column :suggested_dates, :date, :string
  end
end
