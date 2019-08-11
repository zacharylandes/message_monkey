# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
