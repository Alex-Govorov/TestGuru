class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  EMAIL_FORMAT = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/.freeze

  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests, dependent: :destroy
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  validates :email, presence: true
  validates :email, format: { with: EMAIL_FORMAT }
  validates :email, uniqueness: true

  def tests_by_level(test_level)
    tests.by_level(test_level)
  end

  def user_test(test)
    test.user_tests.order(id: :desc).find_by(test: test)
  end
end
