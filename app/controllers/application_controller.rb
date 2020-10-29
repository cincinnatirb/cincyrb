class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :ensure_domain
  APP_DOMAIN = 'cincyrb.com'

  def ensure_domain
    return unless Rails.env == "production"
    if request.env['HTTP_HOST'] != APP_DOMAIN
      # HTTP 301 is a "permanent" redirect
      redirect_to "http://#{APP_DOMAIN}", :status => 301
    end
  end

  def next_meeting
    return 'No meeting found.' unless upcoming_meetings.any?

    time = Time.at(upcoming_meetings.first['time'] / 1000)
    time.strftime('%I:%M %P on %e %b %Y')
  end

  def upcoming_meetings
    @upcoming_meetings ||= Meeting.get_upcoming_meetings
  end
end
