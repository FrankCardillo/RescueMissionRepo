# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.delete_all
q1 = Question.create(asker: "Frank", title: "How do I rails?", body: "blah blah blah")
q2 = Question.create(asker: "Keane", title: "How do I JavaScript?", body: "blah blah blah")

Answer.delete_all
Answer.create(answerer: "David", question_id: q1.id, body: "You should google it")
Answer.create(answerer: "David", question_id: q1.id, body: "You should bing it")
