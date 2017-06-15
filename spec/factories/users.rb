FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@gmail.com"
  end

  # If email to confirmable
  # factory :unconfirmed_user, :class => 'User' do
  factory :user, :class => 'User' do
    email
    password '12345678'
    password_confirmation '12345678'

    # factory :user do
    #   after(:create) { |user| user.confirm }
    # end
  end
end
