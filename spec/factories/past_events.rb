# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :past_event do
    date { Time.zone.today + (1..12).to_a.sample.weeks }
    sequence(:topic) { |n| "Topic #{n}" }

    transient do
      speaker_count { 2 }
    end

    trait :all_fields do
      with_speakers
      description { Faker::Lorem.sentence(word_count: (3..10).to_a.sample) }
    end

    trait :with_speakers do
      after(:create) do |past_event, evaluator|
        evaluator.speaker_count.times { create(:speaker_assignment, past_event:) }
      end
    end
  end
end
