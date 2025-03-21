class PastEventsController < ApplicationController
  before_action :event_info, only: %i[show]

  def index
    @past_events = PastEvent.recent
  end

  def show; end

  private

  def day
    Date.new(year, month, -1).day
  end

  def event_info
    date = Date.new(year, month, 1)
    @event = PastEvent.where(date: date..Date.new(year, month, day)).first
    @meeting_date = date.strftime("%B %Y")
  end

  def month
    params[:month].to_i
  end

  def year
    params[:year].to_i
  end
end
