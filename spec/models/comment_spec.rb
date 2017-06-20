require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "is valid with all parameters" do
    expect(build(:comment)).to be_valid
  end

  it "is stil valid with all parameters, because we use ancestry to add comments for other comments" do
    expect(build(:comment, post:nil)).to be_valid
  end

  it "is invalid without text" do
    comment = build(:comment, text: nil)
    comment.valid?
    expect(comment.errors[:text]).to include("can't be blank")
  end

  it "is invalid without user" do
    comment = build(:comment, user: nil)
    comment.valid?
    expect(comment.errors[:user]).to include("must exist")
  end

  pending "test the relationship with User"
  pending "test the relationship with Post"

  pending "ancestry gem test"
end
