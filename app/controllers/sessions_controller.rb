# frozen-string-literal: true

class SessionsController < ApplicationController
  def create
    email = request.env['omniauth.auth']['info']['email']

    if User.where(email: email).exists?
      session[:current_user] = email
      redirect_to root_path, notice: 'Logged in'
    else
      render text: 'Invalid credentials', status: 422
    end
  end

  def destroy
    session.destroy
    redirect_to :root
  end
end
