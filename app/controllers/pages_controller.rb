class PagesController < ApplicationController
  def index
    @upcoming_meetings = upcoming_meetings
    @next_meeting = next_meeting
  end
end
