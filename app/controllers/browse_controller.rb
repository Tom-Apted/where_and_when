
class BrowseController < ApplicationController

  def index
    if user_signed_in?
      users = User.where.not(id: current_user.id)
      already_swiped = []
      users.each do |user|
        if Swipe.find_by(swiper_id: current_user.id, swipee_id: user.id)
          already_swiped << user
        end
      end
      disliked_me = []
      users.each do |user|
        if Swipe.find_by(swipee_id: current_user.id, swiper_id: user.id, islike: false)
          disliked_me << user
        end
      end
      users_to_browse = []
      users.each do |user|
        if already_swiped.include?(user) == false && disliked_me.include?(user) == false
          users_to_browse << user
        end
      end
      # @chosen_user = users_to_browse.sample
      user1 = User.find(2)
      user2 = User.find(3)
      user3 = User.find(4)
      user4 = User.find(5)
      if users_to_browse.include?(user1)
        @chosen_user = user1
      elsif users_to_browse.include?(user2)
        @chosen_user = user2
      elsif users_to_browse.include?(user3)
        @chosen_user = user3
      elsif users_to_browse.include?(user4)
        @chosen_user = user4
      else
        @chosen_user = users_to_browse.sample
      end
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @chosen_user = User.find(params[:id])
  end

  def like
    @like = Swipe.create(swiper_id: current_user.id, swipee_id: params[:swipee_id], islike: true)
  end

  def dislike
    @dislike = Swipe.create(swiper_id: current_user.id, swipee_id: params[:swipee_id], islike: false)
  end

  private

  def like_params
    params.require(:like).permit(:swipee_id)
  end

  def dislike_params
    params.require(:dislike).permit(:swipee_id)
  end

end
