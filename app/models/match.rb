class Match < ApplicationRecord
  belongs_to :swipe
  has_one :chatroom
  after_create :create_chatroom
  has_one :suggested_date


  private

  def create_chatroom
    self.update(last_interaction: DateTime.now())
    @chatroom = Chatroom.create(match_id: self.id)
  end


end
