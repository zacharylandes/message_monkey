require 'rails_helper'


RSpec.describe Message, type: :model do

  describe 'validations' do
    describe 'invalid attributes' do
      it "can't be created without a Person" do
        message = Message.new
        expect(message).to be_invalid
      end
    end

    describe 'valid attributes' do
      let!(:person) {FactoryBot.create(:person)}
      it 'can be created with a persson' do
        message = Message.new(person:person)
        expect(message).to be_valid
      end
    end
  end

end
