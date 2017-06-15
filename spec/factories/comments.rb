FactoryGirl.define do
  factory :comment do
    association :user
    text "Comment yang bagus gan"
  end
end
