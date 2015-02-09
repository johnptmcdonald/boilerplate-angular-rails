require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    user = FactoryGirl.build(:user)

    expect(user).to be_valid

  end


  it "is invalid without a name" do
    user = FactoryGirl.build(:user)
    user.name = nil
    expect(user).to be_invalid
  end

  it "is invalid without an email" do
    user = FactoryGirl.build(:user)
    user.email = nil
    expect(user).to be_invalid
  end



  it "is invalid if email isn't formatted properly" do
    user = FactoryGirl.build(:user, email: "safdjasdf")
    expect(user).to be_invalid
  end

  it "is invalid if email is not unique" do
    # Create a user with a username
    user = FactoryGirl.create(:user)

    # Create a user with the same username as user #1
    user2 = FactoryGirl.build(:user, name: user.name)

    # Should be invalid
    expect(user2).to be_invalid
  end
end
