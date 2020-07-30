class User < ApplicationRecord
  has_many :user_test, dependent: :destroy
  has_many :tests, through: :user_test, dependent: :destroy
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  scope :tests_by_level, ->(level) { where(level: level) }

  validates :email, presence: true
end
