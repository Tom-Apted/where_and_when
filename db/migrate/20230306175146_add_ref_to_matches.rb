class AddRefToMatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :matches, :swipe, foreign_key: true
  end
end
