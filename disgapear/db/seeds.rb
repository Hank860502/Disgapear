# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
last_name:'Chen',
first_name:'Hank',
image: "notepencoffee.jpeg",
password: '123123',
email: "hank860502@gmail.com",
admin: true
)

Essay.create(
	user_id: 1,
	topic: "Testing",
	description: "1test",
	content: "My name is Hank",
	revision: "My name is Hank.",
	word_limit: 100
)