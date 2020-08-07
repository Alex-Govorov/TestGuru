class ApplicationController < ActionController::Base
  protected

  def find_test
    @test = Test.find(params[:id]) if is_a? TestsController
    @test = Test.find(params[:test_id]) if is_a? QuestionsController
  end
end
