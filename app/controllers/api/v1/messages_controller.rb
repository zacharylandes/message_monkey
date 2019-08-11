class Api::V1::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token


  def create
    message = MessageService.new.create_and_send_auto_message(params)
    if message    
      message.to_json
    else 
      redirect_to messages_path
    end
  end
  
end