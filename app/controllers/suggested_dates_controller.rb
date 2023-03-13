class SuggestedDatesController < ApplicationController
  def create
    time = "20:00 "
    date = "Thurs 3rd March"
    @suggested_date = SuggestedDate.new(time: time, date: date)
    chatroom = Chatroom.find(params[:chatroom_id])
    @suggested_date.match_id = chatroom.match.id
    @suggested_date.date_location_id = DateLocation.find(1).id
    @suggested_date.user = current_user
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
    @our_date = SuggestedDate.find(params[:id])
    # puts our_date.status
    @our_date.status = 'accepted'
    respond_to do |format|
      if @our_date.save
        format.html{ redirect_to chatroom_path(chatroom) }
        format.json
      else
        format.html{ redirect chatroom/show, status: :unprocessable_entity }
        format.json
      end
    end
    # respond_to do |format|
    #   if our_date.save
    #     format.html{ redirect_to chatroom_path(chatroom) }
    #     format.json
    #   else
    #     format.html{ redirect chatroom/show, status: :unprocessable_entity }
    #     format.json
    #   end
    # end
    # chatroom = Chatroom.find(params[:chatroom_id])
    # match = Match.find(chatroom.match_id)
    # our_date = SuggestedDate.find(params[:id])
    # our_date.status = params[:status]
    # our_date.save
  end
end
