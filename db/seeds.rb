# This file should contain all the record creation needed to seed the database with its
# default values.
# The data can then be loaded with the rails db:seed command (or created alongside the
# database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Категории
category_backend = Category.find_or_create_by(title: 'Backend')
category_frontend = Category.find_or_create_by(title: 'Frontend')
category_databases = Category.find_or_create_by(title: 'Databases')

# Пользователи
user_adam = User.find_or_create_by(name: 'Адам') do |user|
  user.email = 'adam@paradise.com'
  user.password = '3vUb3563'
end

user_eva = User.find_or_create_by(name: 'Ева') do |user|
  user.email = 'eva@paradise.com'
  user.password = 'O91735AR'
end

user_god = User.find_or_create_by(name: 'Бог') do |user|
  user.email = 'god@paradise.com'
  user.password = 'E3oko03f'
end

# Тесты
test_html = Test.find_or_create_by(title: 'HTML5') do |test|
  test.level = 0
  test.category = category_frontend
  test.user = user_god
end

test_ruby = Test.find_or_create_by(title: 'Ruby') do |test|
  test.level = 2
  test.category = category_backend
  test.user = user_god
end

test_sql = Test.find_or_create_by(title: 'SQL') do |test|
  test.level = 1
  test.category = category_databases
  test.user = user_god
end

test_python = Test.find_or_create_by(title: 'Python') do |test|
  test.level = 2
  test.category = category_backend
  test.user = user_god
end

# Тесты, которые прошли или проходят пользователи
# !!!
# Вот тут пока не придумал, как защиту от дублей сделать..
user_adam.user_tests.create(test: test_sql, completion_date: 2.weeks.ago)
user_adam.user_tests.create(test: test_python)

user_eva.user_tests.create(test: test_html)

user_god.user_tests.create(test: test_sql, completion_date: 5.years.ago)
user_god.user_tests.create(test: test_ruby)

# Вопросы/Ответы
question1_body = 'Для чего используют тег div?'
question1 = Question.find_or_create_by(body: question1_body) do |question|
  question.test = test_html
end

answer1_q1_body = 'Для создание таблиц'
Answer.find_or_create_by(body: answer1_q1_body) do |answer|
  answer.question = question1
end

answer2_q1_body = 'Для работы с текстом'
Answer.find_or_create_by(body: answer2_q1_body) do |answer|
  answer.question = question1
end

answer3_q1_body = 'Для табличной верстки сайта'
Answer.find_or_create_by(body: answer3_q1_body) do |answer|
  answer.question = question1
end

answer4_q1_body = 'Для блочной верстки сайта'
Answer.find_or_create_by(body: answer4_q1_body) do |answer|
  answer.question = question1
  answer.correct = true
end

question2_body = 'Какой тег не используется при работе с таблицами?'
question2 = Question.find_or_create_by(body: question2_body) do |question|
  question.test = test_html
end

answer1_q2_body = 'Tr'
Answer.find_or_create_by(body: answer1_q2_body) do |answer|
  answer.question = question2
end

answer2_q2_body = 'Th'
Answer.find_or_create_by(body: answer2_q2_body) do |answer|
  answer.question = question2
end

answer3_q2_body = 'Tfoot'
Answer.find_or_create_by(body: answer3_q2_body) do |answer|
  answer.question = question2
end

answer4_q2_body = 'Tt'
Answer.find_or_create_by(body: answer4_q2_body) do |answer|
  answer.question = question2
  answer.correct = true
end

question3_body = 'Какой метод позволяет привести строку в нижний регистр?'
question3 = Question.find_or_create_by(body: question3_body) do |question|
  question.test = test_ruby
end

answer1_q3_body = 'dcase'
Answer.find_or_create_by(body: answer1_q3_body) do |answer|
  answer.question = question3
end

answer2_q3_body = 'down'
Answer.find_or_create_by(body: answer2_q3_body) do |answer|
  answer.question = question3
end

answer3_q3_body = 'lowercase'
Answer.find_or_create_by(body: answer3_q3_body) do |answer|
  answer.question = question3
end

answer4_q3_body = 'downcase'
Answer.find_or_create_by(body: answer4_q3_body) do |answer|
  answer.question = question3
  answer.correct = true
end

question4_body = 'Как называется самый популярный фреймворк языка Ruby для веба?'
question4 = Question.find_or_create_by(body: question4_body) do |question|
  question.test = test_ruby
end

answer1_q4_body = 'Rails'
Answer.find_or_create_by(body: answer1_q4_body) do |answer|
  answer.question = question4
end

answer2_q4_body = 'Ruby Framework'
Answer.find_or_create_by(body: answer2_q4_body) do |answer|
  answer.question = question4
end

answer3_q4_body = 'Ruby Web'
Answer.find_or_create_by(body: answer3_q4_body) do |answer|
  answer.question = question4
end

answer4_q4_body = 'Ruby On Rails'
Answer.find_or_create_by(body: answer4_q4_body) do |answer|
  answer.question = question4
  answer.correct = true
end

question5_body = 'Чем отличается DROP от TRUNCATE?'
question5 = Question.find_or_create_by(body: question5_body) do |question|
  question.test = test_sql
end

answer1_q5_body = 'Оба оператора являются аналогами друг друга'
Answer.find_or_create_by(body: answer1_q5_body) do |answer|
  answer.question = question5
end

answer2_q5_body = 'DROP - очищает таблицу, а TRUNCATE - удаляет'
Answer.find_or_create_by(body: answer2_q5_body) do |answer|
  answer.question = question5
end

answer3_q5_body = 'DROP - удаляет базу данных, а TRUNCATE - удаляет таблицы'
Answer.find_or_create_by(body: answer3_q5_body) do |answer|
  answer.question = question5
end

answer4_q5_body = 'TRUNCATE - очищает таблицу, а DROP - удаляет таблицу или запись'
Answer.find_or_create_by(body: answer4_q5_body) do |answer|
  answer.question = question5
  answer.correct = true
end

question6_body = 'Где верно прописано удаление поля в таблице?'
question6 = Question.find_or_create_by(body: question6_body) do |question|
  question.test = test_sql
end

answer1_q6_body = 'DROP Users COLUMN name;'
Answer.find_or_create_by(body: answer1_q6_body) do |answer|
  answer.question = question6
end

answer2_q6_body = 'SELECT Users DROP COLUMN name;'
Answer.find_or_create_by(body: answer2_q6_body) do |answer|
  answer.question = question6
end

answer3_q6_body = 'TRUNCATE Users DROP COLUMN name;'
Answer.find_or_create_by(body: answer3_q6_body) do |answer|
  answer.question = question6
end

answer4_q6_body = 'ALTER TABLE Users DROP COLUMN name;'
Answer.find_or_create_by(body: answer4_q6_body) do |answer|
  answer.question = question6
  answer.correct = true
end

question7_body = 'Как получить данные от пользователя?'
question7 = Question.find_or_create_by(body: question7_body) do |question|
  question.test = test_python
end

answer1_q7_body = 'Использовать метод get'
Answer.find_or_create_by(body: answer1_q7_body) do |answer|
  answer.question = question7
end

answer2_q7_body = 'Использовать метод read'
Answer.find_or_create_by(body: answer2_q7_body) do |answer|
  answer.question = question7
end

answer3_q7_body = 'Использовать метод readLine'
Answer.find_or_create_by(body: answer3_q7_body) do |answer|
  answer.question = question7
end

answer4_q7_body = 'Использовать метод input'
Answer.find_or_create_by(body: answer4_q7_body) do |answer|
  answer.question = question7
  answer.correct = true
end

question8_body = 'Сколько библиотек можно импортировать в один проект?'
question8 = Question.find_or_create_by(body: question8_body) do |question|
  question.test = test_python
end

answer1_q8_body = 'Не более 10'
Answer.find_or_create_by(body: answer1_q8_body) do |answer|
  answer.question = question8
end

answer2_q8_body = 'Неограниченное количество'
Answer.find_or_create_by(body: answer2_q8_body) do |answer|
  answer.question = question8
  answer.correct = true
end

answer3_q8_body = 'Не более 5'
Answer.find_or_create_by(body: answer3_q8_body) do |answer|
  answer.question = question8
end

answer4_q8_body = 'Не более 23'
Answer.find_or_create_by(body: answer4_q8_body) do |answer|
  answer.question = question8
end
