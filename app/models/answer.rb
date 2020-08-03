class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  def validate_max_answers
    max_answers = 4
    err_msg = "The number of answers cannot be more than #{max_answers}"
    errors.add(:base, err_msg) if question.answers.count >= max_answers
  end
end
