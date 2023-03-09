class Addstatustosuggesteddate < ActiveRecord::Migration[7.0]
  def change
    add_column :suggested_dates, :status, :string, default: "pending"
  end
end
