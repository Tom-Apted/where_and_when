class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :swiper_relationships, foreign_key: :swipee_id, class_name: 'Swipe'
  has_many :swipers, through: :swiper_relationships, source: :swiper

  has_many :swipee_relationships, foreign_key: :swiper_id, class_name: 'Swipe'
  has_many :swipee, through: :swipee_relationships, source: :swipee
end
