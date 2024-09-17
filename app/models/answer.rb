class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :one_question_answers_count

  private

  def one_question_answers_count
    message = "Answers quantity for this question can be between 1 and 4"
    errors.add(:base, message) if question.answers.size >= 4
  end
end
