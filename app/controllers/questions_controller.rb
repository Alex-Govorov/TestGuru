class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit
    @test = @question.test
  end

  def update
    redirect_to test_path(@question.test) if @question.update(question_params)
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      redirect_to test_path(@test)
    else
      render plain: "Error on save question"
    end
  end

  def destroy
    redirect_to @question.test if @question.destroy
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

  def question_params
    params.require(:question).permit(:body)
  end
end
