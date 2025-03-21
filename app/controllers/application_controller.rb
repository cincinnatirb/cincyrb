class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(_resource)
    admin_past_events_path
  end
end
