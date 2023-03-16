class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :swiper_relationships, foreign_key: :swipee_id, class_name: 'Swipe'
  has_many :swipers, through: :swiper_relationships, source: :swiper

  has_many :swipee_relationships, foreign_key: :swiper_id, class_name: 'Swipe'
  has_many :swipees, through: :swipee_relationships, source: :swipee
  has_many :suggested_dates
  has_many_attached :photos
  has_many :chatrooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  def like(user_id)
    swipee_relationships.create(swipee_id: user_id, islike: true)
  end

  def dislike(user_id)
    swipee_relationships.create(swipee_id: user_id, islike: false)
  end

  def matches
    users_who_like = swiper_relationships.where(islike: true).pluck(:swiper_id, :swipee_id)
    p users_who_like
    liked_users = swipee_relationships.where(islike: true).pluck(:swipee_id, :swiper_id)
    p liked_users
    matched_swipe_ids = users_who_like.intersection(liked_users)
    p matched_swipe_ids
    matched_swipes = swipee_relationships.where(islike: true, swipee_id: swiper_relationships.where(islike: true).pluck(:swiper_id)).or(swiper_relationships.where(islike: true, swiper_id: swipee_relationships.where(islike: true).pluck(:swipee_id)))
    # p matched_swipes
    # p matched_swipes.pluck(:id)

    match_instances = Match.where(swipe_id: matched_swipes.pluck(:id)).order(last_interaction: :desc)
    p match_instances
  end

  def chatrooms
    Chatroom.where(match: matches).order(created_at: :desc)
  end

end
