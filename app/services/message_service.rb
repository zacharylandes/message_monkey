class MessageService

  def call(params)
    person= Person.where(email:params["email"]).first
    if person.present?
      begin
        create_message(params)
      rescue => e
         e
      end
    else 
      email_not_found
    end
end
  
  def create_message(params)
    message = Message.new(title: params['title'], body: params['body'], person: person)
    message.save!
  end

  def email_not_found
    false
  end 
end