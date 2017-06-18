require 'rails_helper'

feature 'User system' do

  scenario "login page has signup, remember me, and forgot your password" do
    visit new_user_session_path
    expect(page).to have_content "Remember me"
    expect(page).to have_link "Sign up", href: new_user_registration_path
    expect(page).to have_link "Forgot your password?", href: new_user_password_path
  end

  scenario "user can login with username" do
    user = create(:user)
    login(user)
    expect(page).to have_current_path(root_path)
  end

  scenario "user can login with email" do
    user = create(:user)
    login_with_email(user)
    expect(page).to have_current_path(root_path)
  end

  scenario "show error when use wrong username" do
    user = create(:user)
    user.username = "falseusername"
    login(user)

    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content "Invalid Login or password"
  end

end
