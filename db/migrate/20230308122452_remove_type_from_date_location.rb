class RemoveTypeFromDateLocation < ActiveRecord::Migration[7.0]
  def change
    remove_column :date_locations, :type, :string
    add_column :date_locations, :date_type, :string
  end
end
