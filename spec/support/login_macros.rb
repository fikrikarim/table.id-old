module LoginMacros

  def login(user)
    visit root_path
    click_link 'Login'

    expect(current_path).to eq new_user_session_path
    fill_in 'user_login', with: user.username
    fill_in 'user_password', with: user.password

    find_button('Log in').click
  end

  def login_with_email(user)
    visit root_path
    click_link 'Login'

    expect(current_path).to eq new_user_session_path
    fill_in 'user_login', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Log in'
  end

  def sign_up(user)
    visit new_user_registration_path

    fill_in 'user_username', with: user.username
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password

    click_button 'Sign up'
  end
end
