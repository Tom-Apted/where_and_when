class MatchesController < ApplicationController
  def index
    @user = current_user
    @matches = @user.matches
    # raise
    # now need to do it so that we can accout for new matches created (i.e without any)
  end
end
