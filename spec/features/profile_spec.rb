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

  scenario "logged user can change their profile" do
    user1 = create(:user)
    user1.full_name = 'Fikri Ganteng'
    user1.save!
    login(user1)
    visit user_profile_path(user1.username)
    expect(page).to have_content('Fikri Ganteng')
    click_link('Edit profile')
    expect(page).to have_current_path(edit_profile_path(user1.username))
    fill_in 'user_full_name', with: 'Fikri Karim'
    fill_in 'user_username', with: 'fikrikarim'
    fill_in 'user_bio', with: 'Ini bio edit'
    fill_in 'user_facebook', with: 'fikrikarim'
    fill_in 'user_twitter', with: 'fikrikarim'
    fill_in 'user_instagram', with: 'fikrikarim'
    click_button('Save changes')
    expect(page).to have_content('Fikri Karim')
    expect(page).to have_content('fikrikarim')
    expect(page).to have_content('Ini bio edit')
    expect(page).to have_content('Your profile has been updated')
    expect(page).to have_link href: 'https://www.facebook.com/fikrikarim'
    expect(page).to have_link href: 'https://www.twitter.com/fikrikarim'
    expect(page).to have_link href: 'https://www.instagram.com/fikrikarim'
  end

  scenario "when user change username to a taken username, throw errors" do
    user1 = create(:user)
    user1.username = 'taken_username'
    user1.save!
    user2 = create(:user)
    login(user2)
    visit edit_profile_path(user2.username)
    fill_in 'user_username', with: 'taken_username'
    click_button('Save changes')
    expect(page).to have_current_path(edit_profile_path(user2.username))
    expect(page).to have_content("The username has been taken")
  end

  pending "will show errors other than for existing username update 'The username has been taken'"

  scenario "if the user doesn't have the social media, the button doesn't appear" do |variable|
    user = create(:user)
    login(user)
    visit user_profile_path(user.username)
    expect(page).not_to have_link href: 'https://www.facebook.com/'
    expect(page).not_to have_link href: 'https://www.twitter.com/'
    expect(page).not_to have_link href: 'https://www.instagram.com/'
  end
end
