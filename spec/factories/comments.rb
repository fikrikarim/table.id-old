FactoryGirl.define do
  factory :comment do
    association :user
    association :post
    text "Comment yang bagus gan"
  end
end
