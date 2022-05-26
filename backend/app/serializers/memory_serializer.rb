class MemorySerializer < ActiveModel::Serializer
  attributes :id, :beer_name, :repeat, :user_id, :username, :created_at
  belongs_to :user

  def username
    object.user.name
  end
end
