class BeerSerializer < ActiveModel::Serializer
  attributes :id, :beer_name, :beer_style, :local_name, :local_number, :brewery_name, :brewery_url, :image_url
end
