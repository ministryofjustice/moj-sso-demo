class HomeController < ApplicationController
  before_filter :authenticate_user, except: :logged_out
  rescue_from ActionController::InvalidAuthenticityToken, with: :invalidate_session

  def logged_in
  end

  def logged_out
  end

  def emulate_invalid_auth_token
    raise ActionController::InvalidAuthenticityToken
  end

  private

  def invalidate_session
    redirect_to '/logout'
  end
end
