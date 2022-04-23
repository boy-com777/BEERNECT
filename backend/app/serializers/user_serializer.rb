class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :profile, :favorite_beer
end
