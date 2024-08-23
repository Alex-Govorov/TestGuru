class AboutController < ApplicationController
  def index
  end

  def show
    render template: "about/#{params[:something]}"
  end
end
