# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []

10.times do

	users << User.create(password: '88', username: Faker::Internet.user_name)

end


# 25.times do

# 	posts << Post.create ()

# end

posts = []

users.each do |user|

	25.times do
		posts << Post.create(user_id: user.id, title: Faker::Lorem.sentence(3), body: Faker::Lorem.paragraph(4))
	end

end

users.each do |user|

	35.times do
		Comment.create(user_id: user.id, post_id: posts.sample.id, body: Faker::Lorem.paragraph(1))
	end

end