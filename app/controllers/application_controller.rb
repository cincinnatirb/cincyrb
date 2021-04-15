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
    @next_meeting ||= Meeting.get_next_meeting
  end

  def upcoming_meetings
    @upcoming_meetings ||= Meeting.get_upcoming_meetings
  end
end
