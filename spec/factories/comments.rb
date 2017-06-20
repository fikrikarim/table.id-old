FactoryGirl.define do
  factory :comment do
    association :user
    association :post
    text { Faker::Hacker.say_something_smart }
  end
end
