FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    director { Faker::Superhero.name }
  end
end
