class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_user

  helper_method :current_user

  def require_user
    redirect_to '/auth/google_oauth2' unless current_user
  end

  def current_user
    @current_user ||= User.find_by(email: session[:current_user]) if session[:current_user]
  end

  def extract_time_param(name)
    h = params[name][:start_hour]
    m = params[name][:start_minute]
    am = params[name][:start_ampm]
    date = params[name][:start_date]
    Time.parse("#{h}:#{m}#{am} #{date}")
  end
end
