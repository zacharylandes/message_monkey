require 'rails_helper'

RSpec.describe Message, type: :model do

  describe 'validations' do
    context 'invalid attributes' do
      it "can't be created without a Person" do
        message = Message.new
        expect(message).to be_invalid
      end
    end

    context 'valid attributes' do
      let!(:person) {FactoryBot.create(:person)}
      it 'can be created with a persson' do
        message = Message.new(person:person)
        expect(message).to be_valid
      end
    end
  end

  describe "intance methods" do 
    context "#add_content" do 
    let(:person) {FactoryBot.create(:person, visit_date: (Date.today + 12.days))}
    let(:message) {FactoryBot.create(:message, person: person)}

      it "adds default content to message" do 
        message.add_content
        expect(message.body).to include("Better Place Forests")
      end

      it "default content contains the correct numnber of days to visit date" do 
     
        expect(   message.calculate_days_out).to eq(12)
      end
    end
  end

end
