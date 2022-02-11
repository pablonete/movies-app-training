FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    director
  end
end
