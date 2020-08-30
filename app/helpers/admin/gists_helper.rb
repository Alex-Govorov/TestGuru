class Admin
  module GistsHelper
    def question_link(question)
      link_to(question.body[0..25], admin_question_path(question))
    end
  end
end
