class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validates :answers, length: { in: 1..4 } # Эта валидация не даст создать новый вопрос =(
end
