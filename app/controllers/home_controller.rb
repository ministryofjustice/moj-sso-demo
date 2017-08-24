class HomeController < ApplicationController
  before_filter :authenticate_user, only: :logged_in

  def logged_in
  end

  def logged_out
  end
end
