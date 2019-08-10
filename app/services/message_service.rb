class MessageService

  def call(params)
    begin
     create_message(params)
    rescue => e
      e
    end
  end
  
  def create_message(params)
    person = Person.find_or_create_by!(email: params["email"])
    Message.create!(title: params['message']['title'], body: params['message']['body'], person: person) 
  end

end