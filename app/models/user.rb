class User < ApplicationRecord
  has_many :user_test, dependent: :destroy
  has_many :tests, through: :user_test, dependent: :destroy
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  def tests_by_level(test_level)
    tests.where(level: test_level)
  end
end
