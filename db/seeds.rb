# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Coach.delete_all
Student.delete_all
Coach.create(username: 'james@jamesparkin.co.uk', hashed_password: 'default',
  first_name: 'James', last_name: 'Parkin', email: 'james@jamesparkin.co.uk',
  image_url: 'default.png')
Coach.create(username: 'danielparkin@aol.com', hashed_password: 'default',
  first_name: 'Daniel', last_name: 'Parkin', email: 'danielparkin@aol.com',
  image_url: 'default.png')

Student.create(email: 'mary@world.com', first_name: 'Mary', last_name: 'Waikart',
  coach_id: Coach.find_by_username('danielparkin@aol.com').id, image_url: 'default.png')
Student.create(email: 'elaine@world.com', first_name: 'Elaine', last_name: 'Parkin',
  coach_id: Coach.find_by_username('danielparkin@aol.com').id, image_url: 'default.png')
Student.create(email: 'paul@world.com', first_name: 'Paul', last_name: 'Parkin',
  coach_id: Coach.find_by_username('james@jamesparkin.co.uk').id, image_url: 'default.png')
