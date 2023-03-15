class ChatroomsController < ApplicationController
  before_action :multi
  def index
    @chatrooms = Chatroom.all
    @users = User.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @match = Match.find(@chatroom.match_id)
    @suggested_date = SuggestedDate.new
    @our_dates = SuggestedDate.where(match_id: @match.id)

  end

  def multi
    @multi_dates = []
    chatroom = Chatroom.find(params[:id])
    user = current_user
    outdoors_date = SuggestedDate.new(time: "5pm", date: "Sun 2nd Apr", match_id: chatroom.match.id, date_location_id: 5, status: "proposed", user_id: user.id)
    cocktails_date = SuggestedDate.new(time: "8pm", date: "Thurs 24th Mar", match_id: chatroom.match.id, date_location_id: 8, status: "proposed", user_id: user.id)
    coffee_date = SuggestedDate.new(time: "10am", date: "Sat 1st Apr", match_id: chatroom.match.id, date_location_id: 2, status: "proposed", user_id: user.id)
    @multi_dates << outdoors_date
    @multi_dates << cocktails_date
    @multi_dates << coffee_date


  end

  private

  def chatroom_params
    require(:chatroom).permit(:name, :match_id)
  end

end
