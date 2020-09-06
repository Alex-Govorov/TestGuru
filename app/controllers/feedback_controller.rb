class FeedbackController < ApplicationController
  def new; end

  def create
    @message = params[:message]
    @email = current_user&.email || params[:email]
    @name = current_user&.name || 'Anonymous'

    validate_params

    if params_valid?
      Admin.find_each do |admin|
        FeedbackMailer.new_feedback(admin, @name, @email, @message).deliver_now
      end
      flash[:notice] = t('.message_sent')
    else
      flash[:alert] = @errors.to_sentence
    end
    render :new
  end

  private

  def validate_params
    @errors = []
    @errors << t('.message_blank') if @message.empty?
    @errors << t('.wrong_email_format') unless @email.match(Devise.email_regexp)
  end

  def params_valid?
    @errors.empty?
  end
end
