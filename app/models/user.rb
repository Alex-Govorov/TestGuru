class User < ApplicationRecord
  has_many :user_test
  has_many :tests, through: :user_test

  def tests_by_level(test_level)
    tests.where(level: test_level)
  end
end
