class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: Question.find(params[:id]).inspect
  end

  def new
    # new question
  end

  def create
    question = Question.create(body: params[:body], test: @test)
    render plain: question.inspect
  end

  def destroy
    Question.find(params[:id]).destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_not_found
    render plain: 'Not Found'
  end
end
