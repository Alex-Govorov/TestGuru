class Feedback
  include ActiveModel::Model

  attr_accessor(
    :message,
    :email,
    :user_name
  )

  validates :message, presence: true
  validates :email, format: { with: Devise.email_regexp }

  def send_mail
    return unless valid?

    Admin.find_each do |admin|
      FeedbackMailer.new_feedback(admin, @user_name, @email, @message).deliver_now
    end
  end
end
