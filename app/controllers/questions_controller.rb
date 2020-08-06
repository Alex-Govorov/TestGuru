class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: @question.inspect
  end

  def new; end

  def create
    question = @test.questions.create(question_params)
    render plain: question.inspect
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

  def rescue_with_not_found
    render plain: 'Not Found'
  end

  def question_params
    params.permit(:body)
    # Не разобрался с require
    # у меня передаются параметры:
    # <ActionController::Parameters {"body"=>"22", "authenticity_token"=>"/iokENLPIfhavHwmxp9QB/8aflOczYJ0/IvY044x8St2PFfTSyl4y4VmGab7gZaT5qf/EUZ+tcITnXPwEalr8A==", "controller"=>"questions", "action"=>"create", "test_id"=>"1"} permitted: false>
    # а для вызова params.require(:question).permit(:body)
    # параметры насколько я понимаю должны выглядить так:
    # <ActionController::Parameters {question=>{"body"=>"22", "test_id"=>"1"}, "authenticity_token"=>"/iokENLPIfhavHwmxp9QB/8aflOczYJ0/IvY044x8St2PFfTSyl4y4VmGab7gZaT5qf/EUZ+tcITnXPwEalr8A==", "controller"=>"questions", "action"=>"create"} permitted: false>
    # но как этого добиться, не пойму =(
    # я понимаю как этого добиться в GET запросе
    # но как заставить html форму сформировать POST запрос чтобы передать хэш question=>{"body"=>"22", "test_id"=>"1"} - не понимаю
  end
end
