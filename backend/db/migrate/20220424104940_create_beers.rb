class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :beer_name
      t.string :beer_style
      t.string :local_name
      t.string :local_number
      t.string :brewery_name
      t.string :brewery_url
      t.string :image_url

      t.timestamps
    end
  end
end
