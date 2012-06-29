class PastEventsController < ApplicationController
  def index
    @events = PastEvent.all
  end
end
