class CreateMemories < ActiveRecord::Migration[6.1]
  def change
    create_table :memories do |t|
      t.string :beer_name, null: false
      t.string :repeat, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
