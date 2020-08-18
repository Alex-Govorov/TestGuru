class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to_session_or_root
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def redirect_to_session_or_root
    if session[:url]
      redirect_to session[:url]
      session.delete(:url)
    else
      redirect_to root_path
    end
  end
end
