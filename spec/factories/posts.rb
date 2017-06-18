FactoryGirl.define do
  factory :post do
    association :user
    title { Faker::Book.title }
    text { Faker::Hacker.say_something_smart }
  end
end
