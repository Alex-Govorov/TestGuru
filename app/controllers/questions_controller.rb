class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create edit]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def edit
  end

  def create
    question = @test.questions.new(params.require(:question).permit(:body))

    if question.save
      render plain: question.inspect
    else
      render plain: "Error on save question"
    end
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Question was not found"
  end
end
