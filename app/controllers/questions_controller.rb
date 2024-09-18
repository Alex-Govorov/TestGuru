class QuestionsController < ApplicationController
  def index
    @questions = Test.find(params[:test_id]).questions
    render json: { questions: @questions }
  end
end
