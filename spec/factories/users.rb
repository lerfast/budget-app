# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    name { 'Test User' }
    email { Faker::Internet.unique.email }
    password { 'password' }
    confirmed_at { Time.current } 
  end
end
