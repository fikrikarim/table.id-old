module LoginMacros

  def login(user)
    visit root_path
    click_link 'Login'

    expect(current_path).to eq new_user_session_path
    fill_in 'user_login', with: user.username
    fill_in 'user_password', with: user.password

    find_button('Log in').click
    expect(page).to have_current_path(root_path)
  end

  def login_with_email(user)
    visit root_path
    click_link 'Login'

    expect(current_path).to eq new_user_session_path
    fill_in 'user_login', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Log in'
    expect(page).to have_current_path(root_path)
  end
end
