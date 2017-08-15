require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  it 'comment can be upvoted' do
    comment = create(:comment)
    user = create(:user)
    sign_in user
    expect {
      put :upvote, params: {type: 'Comment', id: comment}
    }.to change{comment.get_upvotes.size}.from(0).to(1)
  end

  it 'get home page with Top' do
    get :home, params: {sort_by: 'Top'}
    expect(response).to be_success
  end

  pending 'get home page with Top' do
    skip('check more thoroughly with feature specs')
  end

  it 'get home page with Newest' do
    get :home, params: {sort_by: 'Newest'}
    expect(response).to be_success
  end

  pending 'get home page with Newest' do
    skip('check more thoroughly with feature specs')
  end

  it 'get home page with Random' do
    get :home, params: {sort_by: 'Random'}
    expect(response).to be_success
  end

  pending 'get home page with Random' do
    skip('check more thoroughly with feature specs')
  end
end
