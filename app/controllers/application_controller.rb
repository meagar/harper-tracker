class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_user

  def require_user
    nil
  end

  def extract_time_param(name)
    h = params[name][:start_hour]
    m = params[name][:start_minute]
    am = params[name][:start_ampm]
    date = params[name][:start_date]
    Time.parse("#{h}:#{m}#{am} #{date}")
  end
end
