class User < ApplicationRecord
  has_many :user_test, dependent: :destroy
  has_many :tests, through: :user_test, dependent: :destroy
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  validates :email, presence: true

  def tests_by_level(test_level)
    tests.by_level(test_level)
  end

  def user_test_find(test)
    test.user_test.order(id: :desc).find_by(test: test)
  end
end
