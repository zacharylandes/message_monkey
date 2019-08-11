class Api::V1::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @messages = Message.all
    @person = Person.new
    @message = Message.new(person: @person)
  end

  def create
    message = MessageService.new.create_and_send_auto_message(params)
    if message     
       message.to_json
    else 
      redirect_to api_v1_messages_path(:modal)
    end
  end
  
  def custom_message
    message = MessageService.new.create_manual_message(params)
    if message 
      flash[:success] = "Message Successfully created"
      redirect_to api_v1_messages_path
    else
      redirect_to api_v1_messages_path(:modal)
    end
  end

  def documentation
    render :documentation
  end

end