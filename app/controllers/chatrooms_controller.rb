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
    time = ["21:00"]
    date = ["Fri 4th March"]
    chatroom = Chatroom.find(params[:id])
    location = DateLocation.all
    user = current_user
    @multi_dates = []
    # @suggested_date.match_id = chatroom.match.id
    # @suggested_date.date_location_id = DateLocation.all.sample.id
    # @suggested_date.user = current_user
    6.times do
      single_date = SuggestedDate.new(time: time.sample, date: date.sample, match_id: chatroom.match.id, date_location_id: location.sample.id, status: "proposed")
      single_date.user = current_user
      @multi_dates << single_date
    end
  end

  private

  def chatroom_params
    require(:chatroom).permit(:name, :match_id)
  end

end
