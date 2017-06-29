require 'rails_helper'

feature 'Profile' do

  scenario "visit the user profile path will show the user profile" do
    user = create(:user)
    user.full_name = 'Fikri Karim'
    user.save
    visit user_profile_path(user.username)
    expect(page).to have_content(user.username)
    expect(page).to have_content(user.full_name)
  end

  scenario "if the visiting the user isnt the logged one, doesn't show 'Edit Profile' button" do
    user1 = create(:user)
    user2 = create(:user)
    login(user2)
    visit user_profile_path(user1.username)
    expect(page).not_to have_content('Edit profile')
  end

  scenario "if the visiting the user isnt the logged one, cannot go to edit_profile_path and will be redirected to root path" do
    user1 = create(:user)
    user2 = create(:user)
    login(user2)
    visit edit_profile_path(user1.username)
    expect(page).to have_current_path(root_path)
  end

  scenario "if the visiting the user is the logged one show 'Edit Profile' button" do
    user1 = create(:user)
    login(user1)
    visit user_profile_path(user1.username)
    expect(page).to have_content('Edit profile')
  end
end
