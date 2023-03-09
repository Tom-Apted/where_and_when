class Match < ApplicationRecord
  belongs_to :swipe
  has_one :chatroom
  after_create :create_chatroom
  has_many :suggested_dates


  private

  def create_chatroom
    @chatroom = Chatroom.create(match_id: self.id)
  end


end
