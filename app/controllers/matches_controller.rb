class MatchesController < ApplicationController
  def index
    @user = current_user
    @matches = Match.all.sort_by { |match| match.chatroom.messages.last.created_at }.reverse
    # raise
  end
end
