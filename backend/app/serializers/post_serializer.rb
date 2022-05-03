class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :recomend_score, :user_id, :username
  belongs_to :user

  def username
    object.user.name
  end
end
