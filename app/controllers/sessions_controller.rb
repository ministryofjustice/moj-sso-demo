class SessionsController < ApplicationController
  def create
    load_sso
    redirect_to session.delete(:redirect_path) || root_path
  end

  def destroy
    if current_user
      sso_logout_url = current_user['links']['logout']
      unload_sso
      redirect_to logout_url(sso_logout_url, redirect_to: root_url)
    else
      redirect_to root_url
    end
  end
  
  private
  
  def load_sso
    auth_data = request.env['omniauth.auth']

    session[:sso_id] = auth_data.fetch('uid')
    session[:sso_user] = auth_data.fetch('info')
    session[:sso_token] = auth_data.dig('credentials', 'token')
    session[:sso_token_expires_at] = auth_data.dig('credentials', 'expires_at')
  end

  def unload_sso
    session.delete(:sso_id)
    session.delete(:sso_user)
    session.delete(:sso_token)
    session.delete(:sso_token_expires_at)
  end

  def logout_url(sso_logout_url, redirect_to: nil)
    url = URI.parse(sso_logout_url)
    url.query = { redirect_to: redirect_to }.to_query if redirect_to
    url.to_s
  end
end
