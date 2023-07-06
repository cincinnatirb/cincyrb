class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(_resource)
    admin_past_events_path
  end

  def next_meeting
    @next_meeting ||= Meeting.next_meeting
  end

  def upcoming_meetings
    @upcoming_meetings ||= Meeting.upcoming_meetings
  end
end
