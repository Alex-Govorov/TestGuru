class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user,
                :logged_in?

  protected

  def authenticate_user!
    return if current_user

    session[:url] = request.original_url
    message = 'Are you a Guru? Verify your Email and Password please'
    redirect_to login_path, alert: message
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
