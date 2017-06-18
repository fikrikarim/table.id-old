require 'rails_helper'

feature 'User system' do

  describe "login" do

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

  context "Sign up" do

    scenario "User will get notification after sign up" do
      user = build(:user)
      sign_up(user)

      expect(page).to have_current_path(root_path)
      expect(page).to have_content "Welcome! You have signed up successfully."
    end

    pending "User will redirect to sign up path when error occurs" do
      user = build(:user)
      sign_up(user)

      expect(page).to have_current_path(new_user_session_path)
    end

    scenario "User doesn't put username" do
      user = build(:user, username: '')
      sign_up(user)

      expect(page).to have_content "Username can't be blank"
    end

    scenario "User doesn't put email" do
      user = build(:user, email: '')
      sign_up(user)

      expect(page).to have_content "Email can't be blank"
    end

    scenario "User doesn't put email" do
      user = build(:user, password: '')
      sign_up(user)

      expect(page).to have_content "Password can't be blank"
    end

    scenario "User doesn't put email" do
      user = build(:user, password: '')
      sign_up(user)

      expect(page).to have_content "Password can't be blank"
    end


  end
  pending "Email confirmation test"

    # before :each do
      # let(:user_username) { 'fikri' }
      # let(:user_email) { 'fikri@table.id' }
      # let(:user_password) { 'NARUTO' }
    #   visit new_user_registration_path

    #   fill_in 'user_username', with: user_username
    #   fill_in 'user_email', with: user_email
    #   fill_in 'user_password', with: user_password
    #   fill_in 'user_password_confirmation', with: user_password

    #   click_button 'Sign up'
    # end


    # it "shows message about confirmation email" do
    #   expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please open the link to activate your account.")
    # end

    # describe "confirmation email" do
    #   # Include email_spec modules here, not in rails_helper because they
    #   # conflict with the capybara-email#open_email method which lets us
    #   # call current_email.click_link below.
    #   # Re: https://github.com/dockyard/capybara-email/issues/34#issuecomment-49528389
    #   include EmailSpec::Helpers
    #   include EmailSpec::Matchers

    #   # open the most recent email sent to user_email
    #   subject { open_email(user_email) }

    #   # Verify email details
    #   it { is_expected.to deliver_to(user_email) }
    #   it { is_expected.to have_body_text(/You can confirm your account/) }
    #   it { is_expected.to have_body_text(/users\/confirmation\?confirmation/) }
    #   it { is_expected.to have_subject(/Confirmation instructions/) }
    # end

    # context "when clicking confirmation link in email" do
    #   before :each do
    #     open_email(user_email)
    #     current_email.click_link 'Confirm my account'
    #   end

    #   it "shows confirmation message" do
    #     expect(page).to have_content('Your account was successfully confirmed')
    #   end

    #   it "confirms user" do
    #     user = User.find_for_authentication(email: user_email)
    #     expect(user).to be_confirmed
    #   end
    # end

end
