class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :profile, :favorite_beer, :avatar, :following, :followers
  has_many :posts
  has_many :memories
  has_many :likes
end
