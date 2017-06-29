require 'rails_helper'

feature 'Navbar', type: :feature do

  scenario "Root path show Table.id link to root" do
    visit root_path
    expect(page).to have_link "Table.id", href: root_path
  end

  scenario "Show 'login' when users not logged in and show 'username' when logged in" do
    user = create(:user)
    visit root_path
    expect(page).not_to have_content user.username
    expect(page).to have_link "Login", href: new_user_session_path
    expect(page).to have_link "Sign up", href: new_user_registration_path
    login(user)

    expect(page).to have_content user.username
    expect(page).to have_link "Submit a story", href: new_post_path
    # expect(page).to have_link "Submit a Post", href: new_user_session_path
    expect(page).not_to have_link "Login", href: new_user_session_path
    expect(page).not_to have_link "Sign up", href: new_user_registration_path
  end

  pending "Test using mobile layout"

  scenario "Log in using email" do
    user = create(:user)

    visit root_path
    expect(page).not_to have_content user.username
    expect(page).to have_link "Login", href: new_user_session_path
    expect(page).to have_link "Sign up", href: new_user_registration_path
    login_with_email(user)

    expect(page).to have_content user.username
    expect(page).not_to have_link "Login", href: new_user_session_path

  end

  scenario "Check for logout button and profile button using js", js: true do
    user = create(:user)
    login(user)

    click_button(user.username)
    expect(page).to have_link user.username, href: user_profile_path(user.username)
    expect(page).to have_link 'Edit profile', href: edit_profile_path(user.username)
    expect(page).to have_link "Logout", href: destroy_user_session_path
    click_link "Logout"

    expect(page).to have_current_path(root_path)
    expect(page).not_to have_content user.username
  end

end
