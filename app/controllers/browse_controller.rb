class BrowseController < ApplicationController

  def index
    users = User.where.not(id: current_user.id)
    @chosen_user = users.sample()
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
