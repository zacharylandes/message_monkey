require 'rails_helper'

#these are response specs testing message creation via API and manual creation through UI
describe "#POST to create a message via API", db_clean: :before_each do
  let!(:person) { FactoryBot.create(:person)}
  let!(:message_service) { double }
  let!(:valid_visit_date){ (Date.today + 12.days).strftime("%m/%d/%Y")}
  let!(:invalid_visit_date){ (Date.today + 12.days).strftime("%m%Y")} 
  let(:valid_params){ {email: person.email, visit_date: valid_visit_date} } 
  let(:valid_message) {FactoryBot.build(:message,person: person)}
  let(:invalid_params){ {email: person.email, visit_date: invalid_visit_date} } 

  it " succesfully creates a message" do
    expect(Message.count).to eq(0) 
    
    allow(message_service).to receive(:create_and_send_auto_message).with(valid_params).and_return(valid_message)

    post "/api/v1/messages", params: valid_params
    
    expect(response.status).to eq(204) 
    expect(Message.count).to eq(1) 
  end

  it "fails to create a message with invalid params" do
    expect(Message.count).to eq(0) 

    allow(message_service).to receive(:create_and_send_auto_message).with(invalid_params).and_return(false)

    post "/api/v1/messages", params: invalid_params
      
    expect(response.status).to eq(302) 
    expect(Message.count).to eq(0) 
  end

end
  
describe "#POST to custom_message to create a message via UI", db_clean: :before_each do
  let!(:person) { FactoryBot.create(:person)}
  let!(:message_service) { double }
  let!(:valid_params) { {message: {body:"test"}, email:person.email}  }
  let!(:invalid_params) { { body:"test", email: "" } }
  let(:valid_message) {FactoryBot.build(:message,person: person)}
  
  it "succesfully creates a message" do
    expect(Message.count).to eq(0) 

    allow(message_service).to receive(:create_manual_message).with(valid_params).and_return(valid_message)

    post "/api/v1/custom_message", params: valid_params

    expect(Message.count).to eq(1) 
  end

  it "fails to create a message with invalid params" do
    expect(Message.count).to eq(0) 

    allow(message_service).to receive(:create_manual_message).with(invalid_params).and_return(false)

    post "/api/v1/messages", params: invalid_params
      
    expect(response.status).to eq(302) 
    expect(Message.count).to eq(0) 

  end
end