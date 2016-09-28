class HomeController < ApplicationController
  def logged_in
    authenticate_user
  end

  def logged_out
    
  end
end
