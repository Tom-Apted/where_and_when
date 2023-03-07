class AddMatchIdToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :match, foreign_key: true
  end
end
