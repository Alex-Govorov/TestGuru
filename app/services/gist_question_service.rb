class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    true unless @client.last_response.data[:html_url].blank?
  end

  def id
    @client.last_response.data[:id]
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GIST_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t('.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
