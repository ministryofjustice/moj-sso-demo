class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    # TODO: in a real application lookup User record from session['sso_id']
    session['sso_user']
  end

private

  def authenticate_user
    unless token_valid?
      session[:redirect_path] = request.original_fullpath
      redirect_to '/auth/mojsso'
    end
  end

  def token_valid?
    session[:sso_token] && session[:sso_token_expires_at] > Time.now.to_i
  end
end
