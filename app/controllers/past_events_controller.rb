class PastEventsController < ApplicationController
  def index
    @events = PastEvent.recent
  end
end
