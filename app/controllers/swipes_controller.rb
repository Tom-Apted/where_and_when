class SwipesController < ApplicationController

  def create
    @swipe = Swipe.create(swiper_id: current_user.id, swipee_id: params[:swipee_id], islike: params[:islike])
    # if the swipe is a like (not a dislike)
    if @swipe.islike
      # check to see if there is the reverse swipe already in the database
      if Swipe.find_by(swiper_id: @swipe.swipee_id, swipee_id: @swipe.swiper_id, islike: true)
        # if there is the reverse swipe already and it is a like, create a match
        Match.create(swipe_id: @swipe.id)
        flash[:notice] = "You matched with #{@swipe.swipee.email}"
      end
    end
    # if yes, create an instance of a match and store in the match DB
    # then,
    redirect_to browse_index_path
  end

end
