class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]

  def index
    @questions = @test.questions
  end

  def show
    @question = Question.find(params[:id])
    render plain: @question.body
  end

  def new
  end

  def create
    question = @test.questions.create(params.require(:question).permit(:body))

    render plain: question.inspect
  end

  def destroy
    Question.find(params[:id]).destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end
end
