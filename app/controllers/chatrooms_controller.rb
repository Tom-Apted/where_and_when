class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
    @users = User.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end


  private

  def chatroom_params
    require(:chatroom).permit(:name, :match_id)
  end
  
end
