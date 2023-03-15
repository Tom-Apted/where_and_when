class SuggestedDate < ApplicationRecord
  belongs_to :match
  belongs_to :date_location
  belongs_to :user

  def findmydate(date, current_user)
    if date.match.swipe.swipee == current_user
      return date.match.swipe.swipee
    elsif date.match.swipe.swiper == current_user
      return date.match.swipe.swipee
    end
  end
end
