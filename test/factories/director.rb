FactoryBot.define do
  factory :director do
    name { Faker::Superhero.name }
    age { 50 }
  end
end
