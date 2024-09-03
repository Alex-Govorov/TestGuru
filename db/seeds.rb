# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

USERS = %w[Alex Eve V]
CATEGORIES = %w[Ruby Go Elixir]
TESTS = %w[Operators Conditions Iterators]

USERS.each { |user_name| User.create(name: user_name) }

CATEGORIES.each { |category| Category.create(title: category) }

20.times { Test.create(title: TESTS.sample,
                       level: rand(9),
                       category_id: Category.all.to_a.sample.id) }

20.times do
  Question.create(body: 'What is one of the key benefits of using eager loading in Active Record?',
                  test_id: Test.all.to_a.sample.id)

  Answer.create(body: 'It increases the number of database queries',
                question_id: Question.last.id)
  Answer.create(body: 'It reduces the number of database queries needed for data retrieval',
                question_id: Question.last.id,
                correct: true)
  Answer.create(body: 'It simplifies the database schema',
                question_id: Question.last.id)
  Answer.create(body: 'It automatically indexes all database fields',
                question_id: Question.last.id)
end

20.times { User.all.to_a.sample.tests << Test.all.to_a.sample }
