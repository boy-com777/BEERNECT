class LikeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :post_id
  has_many :users
  belongs_to :post
end
