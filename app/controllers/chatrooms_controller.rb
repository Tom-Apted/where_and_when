class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
    @users = User.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @match = Match.find(@chatroom.match_id)
    @suggested_date = SuggestedDate.new
    @our_date = SuggestedDate.find_by(match_id: @match.id)
  end


  private
  def chatroom_params
    require(:chatroom).permit(:name, :match_id)
  end
end
