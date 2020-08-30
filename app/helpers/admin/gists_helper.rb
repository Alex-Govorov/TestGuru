class Admin
  module GistsHelper
    def question_link(question)
      body = truncate(question.body, length: 25)
      link_to(body, admin_question_path(question))
    end
  end
end
