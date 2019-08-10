require 'rails_helper'

RSpec.describe User, type: :model do


describe "validations" do
  context "invalid attributes" do

    it "is invalid without a first name" do
      user = build(:user, full_name: nil)
      expect(user).to be_invalid
    end

    it "is invalid without an e-mail" do
      user = build(:user, email: nil)
      expect(user).to be_invalid
    end

    xit "is invalid without a unique e-mail" do
      user_1 = create(:user, email: "gob@example.com")
      user_2 = build(:user, email: "gob@example.com")
      expect(user_2).to be_invalid
    end
  end

end
end

