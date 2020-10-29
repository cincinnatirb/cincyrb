class PastEventsController < ApplicationController
  def index
    @past_events = PastEvent.recent
    @next_meeting = next_meeting
  end
end
