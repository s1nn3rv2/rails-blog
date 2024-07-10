FactoryBot.define do
  factory :blog do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    visibility { 'visible' }
    user { create(:user) }
  end
end
