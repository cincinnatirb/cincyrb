# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :past_event do
    topic { "" }
    date { "" }
    description { "MyText" }
  end
end
