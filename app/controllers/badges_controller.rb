class BadgesController < ApplicationController
  before_action :authenticate_user!
  def index
    @badges = Badge.ordered_by_id
  end
end
