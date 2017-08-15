require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  it "can be upvoted" do
    create(:comment)
    user = create(:user)
    sign_in user
    put :upvote_post
  end

end
