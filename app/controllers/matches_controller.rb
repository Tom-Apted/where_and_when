class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @user = current_user
  end
end
