class PagesController < ApplicationController
  def index
    @upcoming_meetings = upcoming_meetings
    @next_meeting = next_meeting
  end

  def this_month_in_ruby; end
end
