class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validates :answers, length: { minimum: 1, maximum: 4 }
end
