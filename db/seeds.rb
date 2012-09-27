# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Coach.delete_all
Coach.create(username: 'james@jamesparkin.co.uk', hashed_password: 'default',
  first_name: 'James', last_name: 'Parkin', email: 'james@jamesparkin.co.uk',
  image_url: 'default.png')
Coach.create(username: 'danielparkin@aol.com', hashed_password: 'default',
  first_name: 'Daniel', last_name: 'Parkin', email: 'danielparkin@aol.com',
  image_url: 'default.png')
