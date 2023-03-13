class SuggestedDate < ApplicationRecord
  belongs_to :match
  belongs_to :date_location
  belongs_to :user
end
