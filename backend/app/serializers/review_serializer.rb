class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :review_title, :review_content, :review_score, :user_id, :username, :beer_id, :beername
  belongs_to :user
  belongs_to :beer

  def username
    object.user.name
  end

  def beername
    object.beer.name
  end
end
