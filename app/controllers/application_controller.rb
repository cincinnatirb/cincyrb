class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :ensure_domain
  APP_DOMAIN = 'cincyrb.com'

  def ensure_domain
    return unless Rails.env == "production"
    if request.env['HTTP_HOST'] != APP_DOMAIN
      # HTTP 301 is a "permanent" redirect
      redirect_to "http://#{APP_DOMAIN}", :status => 301
    end
  end
end
