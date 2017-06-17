require 'rails_helper'

feature 'Navbar', type: :feature do
  scenario "Show 'login' when users not logged in and show 'username' when logged in" do
    user = create(:user)

    visit root_path
    expect(page).not_to have_content user.username
    expect(page).to have_button "Login"
    login(user)


    expect(page).to have_content user.username
    expect(page).not_to have_content "Login"

    save_and_open_page
  end

  pending "Check for logout button using js"
end
