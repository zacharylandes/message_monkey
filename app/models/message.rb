class Message < ApplicationRecord

  belongs_to :person


  before_save :calculate_days_out, :add_content

  # add a default message to customer if there is no custom message 
  # which calculates the  number of days from today until visit date
  def default_body_text
    "Hello #{person.first_name}, we wanted to let you know that you have
      an upcoming appointment with Better Place Forests in #{calculate_days_out}"
  end
  
  def add_content
    if !body
      self.update_attributes(body: default_body_text)
    end
  end


  def calculate_days_out
    visit_date - Date.today
  end


end
