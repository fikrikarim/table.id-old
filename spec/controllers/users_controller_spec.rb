require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  it "user can update its own profile and show response" do
    user = create(:user)
    sign_in user
    put :update, params: {id: user.to_param, user: {instagram: 'test'}}
    expect(response).to redirect_to(user_path(user.username))
    expect(flash[:notice]).to eq("Your profile has been updated")
  end

  it "user cannot update other user's profile. will be redirected to root path" do
    user = create(:user)
    user2 = create(:user)
    sign_in user2
    put :update, params: {id: user.to_param, user: {instagram: 'test'}}
    expect(response).to redirect_to(root_path)
  end

end
