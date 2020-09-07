class FeedbackController < ApplicationController
  respond_to :html
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    @feedback.send_mail
    flash[:notice] = t('.message_sent') if @feedback.valid?
    respond_with @feedback, location: new_feedback_path
  end

  private

  def feedback_params
    params[:feedback][:email] ||= current_user&.email
    params[:feedback][:user_name] = current_user&.name || 'Anonymous'

    params.require(:feedback).permit(:message, :email, :user_name)
  end
end
