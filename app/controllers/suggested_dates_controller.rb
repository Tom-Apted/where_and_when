class SuggestedDatesController < ApplicationController
  def create
    time = Time.now.strftime("%I:%M %p")
    date = Time.now.to_date
    @suggested_date = SuggestedDate.new(time: time, date: date)
    chatroom = Chatroom.find(params[:chatroom_id])
    @suggested_date.match_id = chatroom.match.id
    @suggested_date.date_location_id = DateLocation.find(1).id
    respond_to do |format|
      if @suggested_date.save
        format.html{ redirect_to chatroom_path(chatroom) }
        format.json
      else
        format.html{ redirect chatroom/show, status: :unprocessable_entity }
        format.json
      end
    end
  end

  def update
    chatroom = Chatroom.find(params[:chatroom_id])
    match = Match.find(chatroom.match_id)
    our_date = SuggestedDate.find(params[:id])
    our_date.status = params[:status]
    our_date.save
  end
end
