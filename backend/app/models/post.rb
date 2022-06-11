class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  # バリデーション
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 200 }
  validates :recomend_score, presence: true, numericality: true, inclusion: { in: 1..5 }
end
