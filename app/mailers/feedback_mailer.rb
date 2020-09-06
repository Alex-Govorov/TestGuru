class FeedbackMailer < ApplicationMailer
  def new_feedback(admin, user_name, user_mail, message)
    @user_name = user_name
    @user_mail = user_mail
    @message = message

    mail to: admin.email
  end
end
