class DatesController < ApplicationController
  def index
    @suggested_dates = SuggestedDate.where(user_id: current_user.id)
    @dates = SuggestedDate.where(status: "accepted")
    @your_dates = @dates.select do |date|
      date.match.swipe.swipee == current_user || date.match.swipe.swiper = current_user
    end
  end
end
