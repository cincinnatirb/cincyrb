# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :admin_user do
    sequence(:email) { |n| "admin.user.#{n}@example.com" }
    password { 'P4ssw0rd!' }
  end
end
