class AddLastInteractionToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :last_interaction, :datetime, default: DateTime.now(), null: false
  end
end
