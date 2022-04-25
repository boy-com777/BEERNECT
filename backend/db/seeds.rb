# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# ビール情報の登録
CSV.foreach('db/csv/beer.csv') do |row|
  Beer.create!(
    beer_name: row[0],
    beer_style: row[1],
    local_name: row[2],
    local_number: row[3],
    brewery_name: row[4],
    brewery_url: row[5],
    image_url: row[6]
  )
end
