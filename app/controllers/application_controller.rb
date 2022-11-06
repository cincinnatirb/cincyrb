class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :ensure_domain
  APP_DOMAIN = 'cincyrb.com'.freeze

  def after_sign_in_path_for(_resource)
    admin_past_events_path
  end

  def ensure_domain
    return unless Rails.env.production?

    if request.env['HTTP_HOST'] != APP_DOMAIN # rubocop: disable Style/GuardClause
      redirect_to("http://#{APP_DOMAIN}", status: :moved_permanently) and return
    end
  end

  def next_meeting
    @next_meeting ||= Meeting.next_meeting
  end

  def upcoming_meetings
    @upcoming_meetings ||= Meeting.upcoming_meetings
  end
end
