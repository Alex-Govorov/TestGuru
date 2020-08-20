class SessionsController < Devise::SessionsController
  after_action :welcome_message, only: :create

  private

  def welcome_message
    flash[:notice] = "Привет, #{current_user.name}"
  end
end
