class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash_message(:success, "Question updated")
      redirect_to test_path(@question.test)
    else
      flash_errors(@question)
      redirect_to edit_question_path(@question)
    end
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      flash_message(:success, "Question created")
    else
      flash_errors(question)
    end
    redirect_to test_path(@test)
  end

  def destroy
    if @question.destroy
      flash_message(:success, "Question destroyed")
    else
      flash_errors(@question)
    end
    redirect_to @question.test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    flash_message(:error, "Question was not found")
    redirect_to tests_path
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
