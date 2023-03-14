class SuggestedDatesController < ApplicationController

  def create
    time = params[:suggested_date][:time]
    date = params[:suggested_date][:date]
    @suggested_date = SuggestedDate.new(time: time, date: date)
    chatroom = Chatroom.find(params[:chatroom_id])
    @suggested_date.match_id = chatroom.match.id
    @suggested_date.date_location_id = params[:suggested_date][:date_location_id]
    @suggested_date.user = current_user
    @suggested_date.status = params[:suggested_date][:status]

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
    @our_date.status = params[:suggested_date][:status]
    respond_to do |format|
      if @our_date.save
        format.html{ redirect_to chatroom_path(chatroom) }
        format.json
      else
        format.html{ redirect chatroom/show, status: :unprocessable_entity }
        format.json
      end
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
