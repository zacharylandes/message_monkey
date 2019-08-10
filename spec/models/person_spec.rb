require 'rails_helper'

RSpec.describe Person, type: :model do
  
  describe 'validations' do
    describe 'invalid attributes' do
      it "can't be created without a email" do
        person = Person.new
        expect(person).to be_invalid
      end
      it "can't be created without a valid email" do
        person = Person.new(email:"2323")
        expect(person).to be_invalid
      end
    end

    describe 'valid attributes' do
      it 'can be created with a valid email' do
        person = Person.new(email:"zach@bpf.com")
        expect(person).to be_valid
      end
    end
  end

end
