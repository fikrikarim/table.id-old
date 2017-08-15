require 'rails_helper'

RSpec.describe Post, type: :model do

  it "is valid with all parameters" do
    expect(build(:post)).to be_valid
  end

  it "is invalid without title" do
    post = build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it "is invalid without user" do
    post = build(:post, user: nil)
    post.valid?
    expect(post.errors[:user]).to include("must exist")
  end

  it "can be upvoted and have the trending score" do
    post = create(:post)
    user = create(:user)
    post.upvote_from user
    expect(post.trending_score).not_to be_nil
  end

  it "can be downvoted and have the trending score" do
    post = create(:post)
    user = create(:user)
    post.downvote_from user
    expect(post.trending_score).not_to be_nil
  end

end
