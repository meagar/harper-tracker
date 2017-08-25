class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_user

  def require_user
    nil
  end
end
