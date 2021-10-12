class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :ensure_domain
  APP_DOMAIN = 'cincyrb.com'.freeze

  def ensure_domain
    return unless Rails.env.production?

    # HTTP 301 is a "permanent" redirect
    redirect_to("http://#{APP_DOMAIN}", status: :moved_permanently) and return unless request.env['HTTP_HOST'] == APP_DOMAIN
  end

  def next_meeting
    @next_meeting ||= Meeting.next_meeting
  end

  def upcoming_meetings
    @upcoming_meetings ||= Meeting.upcoming_meetings
  end
end
