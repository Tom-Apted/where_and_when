class AddReftoSuggestedDate < ActiveRecord::Migration[7.0]
  def change
    add_reference :suggested_dates, :match, foreign_key: true
  end
end
