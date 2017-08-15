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


end
