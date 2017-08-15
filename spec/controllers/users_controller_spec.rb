require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  it "user can update its own profile" do
    user = create(:user)
    sign_in user
    put :update, params: {id: user.to_param, user: {instagram: 'test'}}
    expect(response).to redirect_to(user_path(user.username))
  end

end
