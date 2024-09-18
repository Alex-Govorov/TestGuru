class QuestionsController < ApplicationController
  def index
    @questions = Test.find(params[:test_id]).questions
    render json: { questions: @questions }
  end

  def show
    @question = Question.find(params[:id])
    render plain: @question.body
  end
end
