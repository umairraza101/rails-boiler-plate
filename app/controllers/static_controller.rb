class StaticController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @events = Event.published
  end
end
