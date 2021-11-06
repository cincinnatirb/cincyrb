# Read about factories at https://github.com/thoughtbot/factory_girl
require 'securerandom'

FactoryBot.define do
  factory :video do
    past_event
    url { Faker::Internet.url(host: 'example.com', path: "/videos/#{SecureRandom.alphanumeric(8)}") }
  end
end
