# ApplicationController
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def analytics
    @analytics ||= Analytics.new(current_user, google_analytics_client_id)
  end

  def google_analytics_client_id
    google_analytics_cookie.gsub(/^GA\d\.\d\./, '')
  end

  def google_analytics_cookie
    cookies['_ga'] || ''
  end
end
