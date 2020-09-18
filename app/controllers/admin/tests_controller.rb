class Admin
  class TestsController < Admin::BaseController
    before_action :set_tests, only: %i[index update_inline]
    before_action :set_test, only: %i[show destroy edit update start update_inline]

    def index; end

    def new
      @test = Test.new
    end

    def create
      @test = Test.new(test_params)
      @test.user = current_user

      if @test.save
        redirect_to admin_test_path(@test), notice: t('.success')
      else
        render :new
      end
    end

    def show
      @questions = @test.questions.all
    end

    def edit; end

    def update
      if @test.update(test_params)
        redirect_to admin_test_path(@test)
      else
        render :edit
      end
    end

    def update_inline
      if @test.update(test_params)
        redirect_to admin_tests_path
      else
        render :index
      end
    end

    def destroy
      @test.destroy
      redirect_to admin_tests_path
    end

    private

    def test_params
      params.require(:test).permit(:title, :level, :category_id, :user_id, :time)
    end

    def set_test
      @test = Test.find(params[:id])
    end

    def set_tests
      @tests = Test.all
    end
  end
end
