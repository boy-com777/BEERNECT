class Memory < ApplicationRecord
  belongs_to :user

  # バリデーション
  validates :beer_name, presence: true
end
