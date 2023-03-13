class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :swiper_relationships, foreign_key: :swipee_id, class_name: 'Swipe'
  # has_many :swipers, through: :swiper_relationships, source: :swiper

  has_many :swipee_relationships, foreign_key: :swiper_id, class_name: 'Swipe'
  has_many :swipee, through: :swipee_relationships, source: :swipee
  has_many_attached :photos

  def like(user_id)
    swipee_relationships.create(swipee_id: user_id, islike: true)
  end

  def dislike(user_id)
    swipee_relationships.create(swipee_id: user_id, islike: false)
  end

  def show
    @user = current_user

    render :show
  end

end
