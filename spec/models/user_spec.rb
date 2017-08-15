require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with all parameters" do
    expect(create(:user)).to be_valid
  end

  it "is invalid without username" do
    user = build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid if the username same with the current email" do
    create(:user, email: 'taken@gmail.com')
    user = build(:user, username: 'taken@gmail.com')
    user.valid?
    expect(user.errors[:username]).to include("is invalid")
  end

  it "is invalid with double username" do
    create(:user, username: 'taken')
    user = build(:user, username: 'taken')
    user.valid?
    expect(user.errors[:username]).to include("has already been taken")
  end

  pending "test the relationship with other model"

end
