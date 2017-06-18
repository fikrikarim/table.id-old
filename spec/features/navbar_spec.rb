require 'rails_helper'

feature 'Navbar', type: :feature do

  scenario "Show 'login' when users not logged in and show 'username' when logged in" do
    user = create(:user)
    visit root_path
    expect(page).not_to have_content user.username
    expect(page).to have_link "Login", href: new_user_session_path
    login(user)

    expect(page).to have_content user.username
    expect(page).not_to have_link "Login", href: new_user_session_path

  end

  scenario "Log in using email" do
    user = create(:user)

    visit root_path
    expect(page).not_to have_content user.username
    expect(page).to have_link "Login", href: new_user_session_path
    login_with_email(user)

    expect(page).to have_content user.username
    expect(page).not_to have_link "Login", href: new_user_session_path

  end

  scenario "Check for logout button using js", js: true do
    user = create(:user)
    login(user)

    click_button(user.username)
    expect(page).to have_link "Logout", href: destroy_user_session_path
    click_link "Logout"

    expect(page).to have_current_path(root_path)
    expect(page).not_to have_content user.username
  end

end
