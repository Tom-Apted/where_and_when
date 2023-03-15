class SuggestedDate < ApplicationRecord
  belongs_to :match
  belongs_to :date_location
  belongs_to :user

  def findmydate(current_user)
    if self.match.swipe.swipee == current_user
      return self.match.swipe.swipee
    elsif self.match.swipe.swiper == current_user
      return self.match.swipe.swipee
    end
  end
end
