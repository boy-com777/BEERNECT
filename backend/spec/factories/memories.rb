FactoryBot.define do
  factory :memory do
    beer_name { Faker::Lorem.word }
    user
  end
end
