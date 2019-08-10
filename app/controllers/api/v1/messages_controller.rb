class Api::V1::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @messages = Message.all
    @person = Person.new
    @message = Message.new(person: @person)
  end

  def new 
  end
  
  def create
    message = MessageService.new.call(params)
    if message.class == ActiveRecord::RecordInvalid
      flash[:error] = message
      redirect_to messages_path
    else 
      flash[:notice] = "Successully Created Message"
      redirect_to messages_path
    end
  end

end