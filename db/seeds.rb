# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.find_or_create_by(firstName: "albert",lastName: "einstein",email: "ae@relativity.com")
User.find_or_create_by(firstName: "marie", lastName: "curie", email: "mc@radiation.com")
User.find_or_create_by(firstName: "issac", lastName: "newton", email: "in@gravity.com")
User.find_or_create_by(firstName: "galileo", lastName: "galilei", email: "gg@astronomy.com")

1000.times do
  user = User.new
  user.firstName = Faker::Name::first_name
  user.lastName = Faker::Name::last_name
  user.email = "#{user.firstName}@#{user.lastName}.com"
  user.save
end