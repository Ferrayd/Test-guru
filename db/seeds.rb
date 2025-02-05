# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.delete_all

User.create(user_name: 'albTestert',
            email: 'Test@Test.ru',
            password: 'dasASD')

UserId = User.find_by('email=?', 'Test@Test.ru').id



Category.delete_all

Category.create(
  title: 'Ruby On Rails',
  )

Test.create(
  title: 'Архитектура клиент-сервер и HTTP-протокол',
  level: 1,
  category_id: 1
)

Test.create(
  title: 'Введение в Rails',
  level: 1,
  category_id: 1
)

Question.delete_all

Question.create(
  body: 'Назовите метод получения ресурса',
  test_id: 1
)

Question.create(
  body: 'Назовите метод создания ресурса',
  test_id: 2
)

Answer.delete_all

Answer.create([ {
                 title: 'GET',
                 correct: 1,
                 question_id: 1
               }, {
                 title: 'POST',
                 correct: 1,
                 question_id: 1
               }, {
                 title: 'DELETE',
                 correct: 0,
                 question_id: 1
               } ])

Answer.create([ {
                 title: 'GET',
                 correct: 0,
                 question_id: 2
               }, {
                 title: 'POST',
                 correct: 1,
                 question_id: 2
               }, {
                 title: 'DELETE',
                 correct: 0,
                 question_id: 2
               } ])

TestsOfUser.delete_all

Tests = Test.where('level=1')

Tests.each do |test|
  TestsOfUser.create(test_id: test.id, user_id: UserId)
end
