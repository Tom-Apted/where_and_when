class Match < ApplicationRecord
  belongs_to :swipe
  has_one :chatroom
  after_create :create_chatroom

  private

  def create_chatroom
    Chatroom.create(match_id: self.id)
  end
end
