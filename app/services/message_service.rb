require "#{Rails.root}/app/bpf/text.rb"
class MessageService

  #automated create and send message system coming from agnostic service
  def create_and_send_auto_message(params)
    begin
      person = Person.where(email: params["email"]).first
      visit_date = Date.strptime(params[:visit_date],"%m/%d/%Y")
      person.update_attributes!(visit_date: visit_date)
      message = Message.create!(body: params['body'], person: person) 
      message.update_attributes(sent: true) if ::BPF::Text.send(person.phone, message.body)
      message
    rescue => e
      false
    end
  end

  #manually created message coming through ui
  def create_manual_message(params)
    begin
      person = Person.where(email: params["email"]).first
      body = params['message']['body'] || ""
      message = Message.create!(body: body, person: person)
      message
    rescue => e
      false
    end
  end
  
  def manage_update(params)
    message = Message.find(params[:id])
    if params[:commit] == "Send"
      if ::BPF::Text.send(message.person.phone, message.body)
         message.update_attributes(sent: true) 
      else
        false
      end
    else
      body =  params[:message][:body] || ""
      message.update_attributes!(body: body)
    end
  end
end