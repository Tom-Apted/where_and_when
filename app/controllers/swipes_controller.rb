class SwipesController < ApplicationController

  def create
    @swipe = Swipe.create(swiper_id: current_user.id, swipee_id: params[:swipee_id], islike: params[:islike])
    redirect_to browse_index_path
  end

end
