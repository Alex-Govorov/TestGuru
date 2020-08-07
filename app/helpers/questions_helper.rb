module QuestionsHelper
  def question_header
    if action_name == 'new'
      "Create New #{@test.title} Question"
    else
      "Edit #{@question.test.title} Question"
    end
  end
end
