class FeedbackMailer < ApplicationMailer
  def new_feedback(admin, user, message)
    @user_name = user.name
    @user_mail = user.email
    @message = message

    mail to: admin.email
  end
end
