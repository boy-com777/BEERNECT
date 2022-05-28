class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :recomend_score, :user_id, :username, :created_at, :image
  belongs_to :user
  has_many :likes

  def username
    object.user.name
  end
end
