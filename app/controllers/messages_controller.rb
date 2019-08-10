class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @messages = Message.all
    @person = Person.new
    @message = Message.new(person: @person)
  end

  def new 
  end
  
  def create
    message = MessageService.new.call(params['message'])
    if message
     redirect_to messages_path
    else 
      flash[:error] = "couldn't save"
    end
  end

end