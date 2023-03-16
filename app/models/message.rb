class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  after_commit :update_match_interaction
  validates_presence_of :content

  def update_match_interaction
    self.chatroom.match.update(last_interaction: self.updated_at)
  end
end
