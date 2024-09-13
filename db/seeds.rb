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

USERS.each { |user_name| (@users ||= []) << User.create(name: user_name) }

CATEGORIES.each { |category| (@categories ||= []) << Category.create(title: category) }

20.times { (@tests ||= []) << Test.create(title: TESTS.sample,
                                          level: rand(9),
                                          category_id: @categories.sample.id,
                                          author_id: @users.sample.id
                                          ) }

20.times do
  question = Question.create(body: 'What is one of the key benefits of using eager loading in Active Record?',
                             test_id: @tests.sample.id)

  Answer.create(body: 'It increases the number of database queries',
                question_id: question.id)
  Answer.create(body: 'It reduces the number of database queries needed for data retrieval',
                question_id: question.id,
                correct: true)
  Answer.create(body: 'It simplifies the database schema',
                question_id: question.id)
  Answer.create(body: 'It automatically indexes all database fields',
                question_id: question.id)
end

20.times { @users.sample.tests << @tests.sample }
