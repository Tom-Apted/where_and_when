class AddUserRefToSuggestedDates < ActiveRecord::Migration[7.0]
  def change
    add_reference :suggested_dates, :user, null: false, foreign_key: true
  end
end
