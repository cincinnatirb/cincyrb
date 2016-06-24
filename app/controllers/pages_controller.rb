class PagesController < ApplicationController
  def index
    @upcoming_meetings = Meeting.get_upcoming_meetings || []
  end
end
