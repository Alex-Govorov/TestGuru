class Admin
  class QuestionsController < Admin::BaseController
    before_action :set_test, only: %i[index create new]
    before_action :set_question, only: %i[show destroy update edit]

    rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

    def index
      @questions = @test.questions
    end

    def new
      @question = @test.questions.new
    end

    def create
      @question = @test.questions.new(question_params)

      if @question.save
        redirect_to admin_question_path(@question)
      else
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @question.update(question_params)
        redirect_to admin_test_path(@question.test)
      else
        render :edit
      end
    end

    def destroy
      @question.destroy
      redirect_to admin_test_path(@question.test)
    end

    private

    def set_question
      @question = Question.find(params[:id])
    end

    def rescue_with_not_found
      render plain: 'Not Found'
    end

    def question_params
      params.require(:question).permit(:body)
    end

    def set_test
      @test = Test.find(params[:test_id])
    end
  end
end
