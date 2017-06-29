require 'rails_helper'

feature 'Profile' do

  scenario "visit the user profile path will show the user profile" do
    user = create(:user)
    user.full_name = 'Fikri Karim'
    visit user_profile_path(user)
    expect(page).to have_content(user.username)
    expect(page).to have_content(user.full_name)
  end
end
