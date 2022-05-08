class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :recomend_score, :user_id, :username, :created_at
  belongs_to :user

  def username
    object.user.name
  end
end