# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :speaker do
    name { "MyString" }
    bio { "MyText" }
  end
end
