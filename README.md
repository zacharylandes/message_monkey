# README

  #Welcome to Message Monkey
  Here you can create and update text messages to your BPF customers
  You can also use an outside service to hit out POST create message API
  to hit the API simply send a POST with the following attributes -

 EMAIL KEY = the email of an established customer
 VISIT DATE KEY  = the visit date for the customer 

   `curl -i -X POST -H "Content-Type: application/json" -d "{\"email\":\"admin@bpf.com\",\"visit_date\":\"01/01/2019\"}" http://localhost:3000/api/v1/messages`


To install and run locally simply:
 - clone the directory
 - run `bundle install`
 - run `rspec`
 - run `bundle exec rake db:{create,migrate,seed}`
 - run `rails s` and go 
