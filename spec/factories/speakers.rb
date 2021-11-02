# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :speaker do
    name { Faker::Name.unique.name }
    bio { Faker::Lorem.sentence(word_count: (3..10).to_a.sample) }
  end
end
