# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :past_event do
    date { Time.zone.today + (1..12).to_a.sample.weeks }
    sequence(:topic) { |n| "Topic #{n}" }
  end
end
