class Admin
  class BadgesController < Admin::BaseController
    before_action :set_badge, only: %i[show destroy edit update]

    def index
      @badges = Badge.all.order(:id)
    end

    def new
      @badge = Badge.new
    end

    def create
      @badge = Badge.new(badge_params)

      if @badge.save
        redirect_to admin_badges_path, notice: t('.success')
      else
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @badge.update(badge_params)
        redirect_to admin_badges_path
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy
      redirect_to admin_badges_path
    end

    private

    def badge_params
      params.require(:badge).permit(:title, :image_path, :rule_name, :rule_value)
    end

    def set_badge
      @badge = Badge.find(params[:id])
    end
  end
end
