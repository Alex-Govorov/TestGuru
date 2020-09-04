class FeedbackController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    Admin.find_each do |admin|
      FeedbackMailer.new_feedback(admin, current_user, params[:message]).deliver_now
    end
    flash[:notice] = t('.message_sent')
    redirect_to root_path
  end
end
