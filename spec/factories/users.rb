FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@gmail.com"
  end
  sequence :username do |n|
    "user#{n}"
  end

  # If email to confirmable
  # factory :unconfirmed_user, :class => 'User' do
  factory :user, :class => 'User' do
    username
    email
    password '12345678'
    password_confirmation '12345678'

    # factory :user do
    #   after(:create) { |user| user.confirm }
    # end
  end
end
