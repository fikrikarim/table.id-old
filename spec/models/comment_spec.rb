require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "is valid with all parameters" do
    expect(build(:comment)).to be_valid
  end

  it "is invalid without text" do
    comment = build(:comment, text: nil)
    comment.valid?
    expect(comment.errors[:text]).to include("can't be blank")
  end
end
