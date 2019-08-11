
num = (1..45).to_a

Person.create!( email:"admin@bpf.com",
                first_name: Faker::Name.first_name,
                last_name:  Faker::Name.last_name,
                visit_date: Faker::Date.backward(num.sample).strftime("%m/%d/%Y"),
                phone: Faker::PhoneNumber.cell_phone)

10.times do 
  person = Person.create!(email:Faker::Internet.email,
                          first_name: Faker::Name.first_name,
                          last_name:  Faker::Name.last_name,
                          visit_date: Faker::Date.forward(num.sample).strftime("%m/%d/%Y"),
                          phone: Faker::PhoneNumber.cell_phone)

  Message.create!(person: person)
end
