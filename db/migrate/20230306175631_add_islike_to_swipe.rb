class AddIslikeToSwipe < ActiveRecord::Migration[7.0]
  def change
    add_column :swipes, :islike, :boolean
  end
end
