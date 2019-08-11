# Welcome to Message Monkey

  Here you can create and update text messages to your BPF customers.
  You can also use an outside service to hit our  message API to send automated texts to BPF customers.<br />

  To hit the API simply send a POST with the following attributes -

 EMAIL KEY = the email of an established customer <br />
 VISIT DATE KEY  = the visit date for the customer <br />

   `curl -i -X POST -H "Content-Type: application/json" -d "{\"email\":\"admin@bpf.com\",\"visit_date\":\"01/01/2019\"}" https://message-monkey.herokuapp.com/api/v1/messages` <br />


 Visit the site live at https://message-monkey.herokuapp.com

 - This app uses Ruby 2.5.1 and Rails 5.2.3

To install and run locally simply:
 - clone the directory
 - run `bundle install`
 - run `rspec`
 - run `bundle exec rake db:{create,migrate,seed}`
 - run `rails s` and go to `http://localhost:3000/`
