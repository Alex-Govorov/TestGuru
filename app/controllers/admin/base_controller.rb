class Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :admin_required!

    private

    def admin_required!
      msg = 'You are not authorized to view this page.'
      redirect_to root_path, alert: msg unless current_user.admin?
    end
  end
end
