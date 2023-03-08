class Match < ApplicationRecord
  belongs_to :swipe
  has_one :chatroom
  after_create :create_chatroom, :create_suggested_date

  private

  def create_chatroom
    @chatroom = Chatroom.create(match_id: self.id)
  end

  def create_suggested_date
    time = Time.now.strftime("%I:%M %p")
    date = Time.now.to_date
    @suggested_date = SuggestedDate.new(time: time, date: date)
    @suggested_date.match_id = @chatroom.match.id
    @suggested_date.date_location_id = DateLocation.find(1).id
    @suggested_date.save
  end
end
