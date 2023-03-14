class DateLocation < ApplicationRecord
  has_many :suggested_dates
  has_one_attached :photo
end
