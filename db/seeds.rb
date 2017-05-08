# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:email => 'riya.raju@mobme.in', :password => 'riya1234', :password_confirmation => 'riya1234', :username => 'Riya Raju', :phone_number => '9819819819', :age => 24, :role => 'admin')
