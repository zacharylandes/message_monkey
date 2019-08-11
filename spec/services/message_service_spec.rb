require 'rails_helper'


describe MessageService, db_clean: :before_each do
  let!(:person) { FactoryBot.create(:person)}
  let!(:valid_visit_date){ (Date.today + 12.days).strftime("%m/%d/%Y")}
  let!(:invalid_visit_date){ (Date.today + 12.days).strftime("%m%Y")} 
  let(:valid_auto_params){  ActionController::Parameters.new({"email": person.email, "visit_date": valid_visit_date}) } 
  let(:invalid_auto_params){  ActionController::Parameters.new({"email": "invalid_email", "visit_date": invalid_visit_date}) } 
  let(:valid_custom_params){  ActionController::Parameters.new({"email": person.email, "message"=>{"body" => "test"}}) } 
  
  let(:invalid_custom_params){  ActionController::Parameters.new({"email": "invalid_email", "message"=>{"body" => "test"}}) } 
  subject { MessageService.new }
  
  #tests a succesful and failed instance of the MessageService using create_and_send_auto_message
  context "#create_and_send_auto_message" do 
    it "succesfully creates a message" do
      expect(subject.create_and_send_auto_message(valid_auto_params).class).to eq(Message) 
    end
    
    it "fails to create a message with invalid params" do
      expect(subject.create_and_send_auto_message(invalid_auto_params)).to eq(false) 
    end
  end
  
  #tests a succesful and failed instance of the MessageService using create_manual_message
  context "#create_manual_message" do
    it "succesfully creates a message" do
      expect(subject.create_manual_message(valid_custom_params).class).to eq(Message) 
    end
    
    it "fails to create a message with invalid params" do
      expect(subject.create_manual_message(invalid_custom_params)).to eq(false) 
    end
  end 
  
  context "#manage_update" do
    let(:message) {FactoryBot.create(:message, person: person)}
    let(:update_params){  ActionController::Parameters.new({"id": message.id, "message"=>{"body" => "test"}}) } 
   
    it "succesfully udpates a message" do
      expect(subject.manage_update(update_params)).to eq(true) 
    end

    it "sends a messages" do
      update_params.merge!({:commit => "Send"})
      
      subject.manage_update(update_params)
    
      expect(Message.first.sent).to eq(true) 
    end
  end 

end