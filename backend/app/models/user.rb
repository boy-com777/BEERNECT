class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :memories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  # バリデーション
  validates :uid, presence: true
  validates :name, presence: true, length: { maximum: 12 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :profile, length: { maximum: 200 }

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  # 現在のユーザーがふぉろーされてたらtrueを返す
  def followers?(other_user)
    followers.include?(other_user)
  end
end
