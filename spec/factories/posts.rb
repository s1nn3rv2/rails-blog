FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    blog { create(:blog) }
  end
end
