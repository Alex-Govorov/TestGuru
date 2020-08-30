class UserTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_test, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @user_test.accept!(params[:answer_ids])
    if @user_test.completed?
      TestsMailer.completed_test(@user_test).deliver_now
      redirect_to result_user_test_path(@user_test)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@user_test.current_question)
    service.call

    if service.success?
      flash[:notice] = t('.success', link: helpers.gist_link(service.id, t('.saved')))
      Gist.create!(gist_id: service.id, user: current_user, question: @user_test.current_question)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @user_test
  end

  private

  def set_user_test
    @user_test = UserTest.find(params[:id])
  end
end
