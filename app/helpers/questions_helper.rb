module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Edit #{question.test.title} Question"
    elsif question.new_record?
      "Create New #{question.test.title} Question"
    end
  end
end
