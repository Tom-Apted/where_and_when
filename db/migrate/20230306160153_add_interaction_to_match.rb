class AddInteractionToMatch < ActiveRecord::Migration[7.0]
  def change
    add_reference :matches, :interaction, foreign_key: true
  end
end
