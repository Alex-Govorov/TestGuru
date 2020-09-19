class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :badge_progresses, dependent: :destroy
  has_many :badges, through: :badge_progresses, dependent: :destroy

  before_validation :set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids) && !time_is_up?
    self.successfully = successful?
    self.current_question = nil if time_is_up?
    save!
  end

  def success_rate
    self.correct_questions.fdiv(self.test.questions.count) * 100
  end

  def successful?
    success_rate > 85
  end

  def question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def total_questions
    self.test.questions.count
  end

  def end_time
    created_at + test.time.minutes
  end

  def time_is_up?
    Time.now > end_time
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question&.id).first
    end
  end

  def set_current_question
    self.current_question = next_question
  end
end
