module QuestionsHelper
  def question_header
    action_headers = { "new" => "Create New #{@test.title} Question",
                       "edit" => "Edit #{@test.title} Question" }
    action_headers[action_name]
  end
end
