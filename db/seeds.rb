# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |i|
  User.create(name: "name#{i}")
end

1000.times do |i|
  Question.create(title: "title#{i}", content: "content" * 40, user_id: User.pluck(:id).shuffle!.first)
end

10000.times do |i|
  Answer.create(content: "content" * 20, question_id: Question.pluck(:id).shuffle!.first)
end
