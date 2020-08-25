module QuestionsHelper
  def question_header
    if @question.new_record?
      # "Create New #{@question.test.title} Question"
      t('.create_new_question', title: @question.test.title)
    else
      # "Edit #{@question.test.title} Question"
      t('.edit_question', title: @question.test.title)
    end
  end
end
