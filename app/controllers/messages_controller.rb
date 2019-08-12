class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @messages = Message.all.sort_by(&:updated_at).reverse
    @person = Person.new
    @message = Message.new(person: @person)
      
    @emails = Person.all.map{|a|a.email}
  end

  def create
    message = MessageService.new.create_manual_message(params)
    if message 

      flash[:success] = "Message Successfully created"
      redirect_to messages_path
    else
      redirect_to messages_path(:modal)
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    updated_message = MessageService.new.manage_update(params)
    if message 
      flash[:success] = "Message Successfully Updated"
      redirect_to message_path(message)
    else
      flash[:danger] = "Message Was not updated"
      redirect_to message_path(message)
    end
  end

  def destroy 
    message = Message.find(params[:id])
    if message.delete
      flash[:success] = "Message Successfully Deleted"
      redirect_to messages_path
    else
      flash[:danger] = "Message Was not updated"
      redirect_to message_path(message)
    end
  end

  def documentation
    render :documentation
  end

end