class CreateSwipes < ActiveRecord::Migration[7.0]
  def change
    create_table 'swipes' do |t|
      t.integer 'swipee_id', null: false
      t.integer 'swiper_id', null: false

      t.timestamps null: false
    end

    add_index :swipes, :swipee_id
    add_index :swipes, :swiper_id
    add_index :swipes, [:swipee_id, :swiper_id], unique: true
  end
end
