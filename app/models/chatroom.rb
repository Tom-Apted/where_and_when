class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :match

#   def latest_activity
#     latest_message = match.chatroom.messages.last.content .order(created_at: :desc).first
#     latest_message ? latest_message.created_at : created_at
#   end
end
